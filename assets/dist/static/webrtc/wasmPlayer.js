function clearCanvasById(canvasId) {
  const canvas = document.getElementById(canvasId);
  if (!canvas) {
    console.warn(`Canvas with id "${canvasId}" not found.`);
    return;
  }

  const gl =
    canvas.getContext("webgl") || canvas.getContext("experimental-webgl");
  if (!gl) {
    console.warn(
      `WebGL context not available for canvas with id "${canvasId}".`
    );
    return;
  }

  // 设置背景颜色为黑色
  gl.clearColor(0.0, 0.0, 0.0, 1.0); // RGBA: 黑色 (R=0, G=0, B=0, A=1)
  gl.clear(gl.COLOR_BUFFER_BIT); // 清空画布
}

class VideoPlayer {
  static instances = {};
  constructor(decoderType = DECODER_H264, logLevel = LOG_LEVEL_WASM) {
    this.decoder_type = decoderType;
    this.log_level = logLevel;
    this.streams = [];
    this.videoCallback = null;
  }

  initializeStreams(streams) {
    if (!this.videoCallback) {
      // 初始化一次视频回调
      this.videoCallback = Module.addFunction(
        this.createVideoCallback(),
        "viiiiiiiii"
      );
    }

    streams.forEach((item, index) => {
      if (!item.initialized) {
        item.ffmpeg_context = Module._openDecoder(
          this.decoder_type,
          this.videoCallback,
          index,
          this.log_level
        );
        this.setupWebSocket(item);
        item.initialized = true;
        this.streams.push(item);
        // 将当前实例保存到静态属性中
        VideoPlayer.instances[item.index] = this;
      }
      console.log("Initialized streams:", this.streams);
    });
  }

  // 关闭指定的连接
  stopConnection(index) {
    const videoPlayer = VideoPlayer.instances[index];
    if (!videoPlayer) {
      console.warn(`No VideoPlayer instance found for index: ${index}`);
      return;
    }

    console.log("Current streams:", videoPlayer.streams); // 调试日志
    const item = videoPlayer.streams.find(stream => stream.index === index);
    if (!item) {
      console.warn(`No stream found with index: ${index}`);
      return;
    }

    // 关闭 WebSocket 连接
    if (item.socket && item.socket.readyState !== WebSocket.CLOSED) {
      item.socket.close();
    }

    // 清理 WebSocket 相关属性
    item.socket = null;
    item.lastMessageTime = null;
    item.reconnectAttempts = 0;
    item.reconnecting = false;

    // 释放解码器资源
    if (item.ffmpeg_context) {
      Module._closeDecoder(item.ffmpeg_context); 
      item.ffmpeg_context = null;
    }

    // 清除画布（通过 canvasId）
    const canvasId = `WASMPlayer${item.index}`;
    clearCanvasById(canvasId);

    // 移除流对象
    videoPlayer.streams = videoPlayer.streams.filter(
      stream => stream.index !== index
    );

    // 从静态属性中移除实例
    delete VideoPlayer.instances[index];
  }

  createVideoCallback() {
    return function(
      addr_y,
      addr_u,
      addr_v,
      stride_y,
      stride_u,
      stride_v,
      width,
      height,
      nContext
    ) {
      let size = width * height + 2 * (width / 2) * (height / 2);
      let data = new Uint8Array(size);
      let pos = 0;

      for (let i = 0; i < height; i++) {
        let src = addr_y + i * stride_y;
        data.set(HEAPU8.subarray(src, src + width), pos);
        pos += width;
      }

      for (let i = 0; i < height / 2; i++) {
        let src = addr_u + i * stride_u;
        data.set(HEAPU8.subarray(src, src + width / 2), pos);
        pos += width / 2;
      }

      for (let i = 0; i < height / 2; i++) {
        let src = addr_v + i * stride_v;
        data.set(HEAPU8.subarray(src, src + width / 2), pos);
        pos += width / 2;
      }

      const obj = { data, width, height, nContext };
      // this.displayVideoFrame(obj, this.streams.find(i => i.index === nContext));
      this.displayVideoFrame(obj, this.streams[0]);
    }.bind(this);
  }

  setupWebSocket(item) {
    item.socket = new WebSocket(item.wsUrl);
    item.socket.binaryType = "arraybuffer";

    // 更新item对象以包含必要的属性
    item.lastMessageTime = Date.now();
    item.reconnectAttempts = 0;
    item.reconnecting = false;

    item.socket.onmessage = this.handleSocketMessage.bind(this, item);
    item.socket.onerror = this.handleError.bind(this, item.index);
    item.socket.onopen = event => this.handleOpen(item, event); // 修改为传入item参数
    item.socket.onclose = event => this.handleClose(item, event);

    // 设置超时重连检查
    // this.setupTimeoutCheck(item);
  }

  setupTimeoutCheck(item) {
    const self = this;
    let timeoutCheckInterval;

    // 更新最后接收消息的时间戳
    function updateLastMessageTime() {
      item.lastMessageTime = Date.now();
    }

    // 处理接收到的消息
    item.socket.onmessage = function(event) {
      updateLastMessageTime();
      self.handleSocketMessage(item, event);
    };

    // 启动超时检查定时器
    timeoutCheckInterval = setInterval(() => {
      const currentTime = Date.now();
      const timeSinceLastMessage = currentTime - item.lastMessageTime;

      // 如果超过一定时间没有收到消息，则认为连接已失效或数据流停止
      if (timeSinceLastMessage > 3000) {
        clearInterval(timeoutCheckInterval);
        self.reconnectWebSocket(item);
      }
    }, 5000); // 每5秒检查一次
  }
  reconnectWebSocket(item) {
    const self = this;
    if (!item.reconnecting) {
      item.reconnecting = true;
      setTimeout(function reconnect() {
        self.setupWebSocket(item); // 尝试重新建立连接
        item.reconnecting = false;
      }, 5000); // 每5秒尝试一次重连
    }
  }

  handleSocketMessage(item, event) {
    const typedArray = new Uint8Array(event.data);
    if (typedArray[0] === 0) {
      // 检查是否为视频数据
      const nDataSize = event.data.byteLength;
      const cacheBuffer = Module._malloc(nDataSize);
      Module.HEAPU8.set(typedArray, cacheBuffer);
      Module._decodeData(
        item.ffmpeg_context,
        cacheBuffer,
        nDataSize,
        item.pts++
      );
      Module._free(cacheBuffer);
    }
  }

  handleError(index, event) {
    console.error(`WebSocket error for index: ${index}`, event);
  }

  handleOpen(index) {
    console.log(`WebSocket opened for index: ${index}`);
  }

  handleClose(index) {
    console.log(`WebSocket closed for index: ${index}`);
  }

  displayVideoFrame(obj, item) {
    if (!item.webglPlayer) {
      const canvasId = `WASMPlayer${item.index}`;
      const canvas = document.getElementById(canvasId);
      item.webglPlayer = new WebGLPlayer(canvas, {
        preserveDrawingBuffer: false
      });
    }
    item.webglPlayer.renderFrame(
      obj.data,
      obj.width,
      obj.height,
      obj.width * obj.height,
      (obj.width / 2) * (obj.height / 2)
    );
  }
}

// 定义常量
const LOG_LEVEL_JS = 0;
const LOG_LEVEL_WASM = 1;
const LOG_LEVEL_FFMPEG = 2;
const DECODER_H264 = 0;
const DECODER_H265 = 1;

window.VideoPlayer = VideoPlayer;
