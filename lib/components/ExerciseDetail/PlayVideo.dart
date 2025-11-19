import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// 显示视频预览弹窗
void showVideoPreviewDialog(BuildContext context, String videoUrl) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => VideoDialog(videoUrl: videoUrl),
  );
}

class VideoDialog extends StatefulWidget {
  final String videoUrl;

  const VideoDialog({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoDialog> createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {
          _totalDuration = _controller.value.duration;
        });
        _controller.play();
        _isPlaying = true;
        _startListening();
      });
  }

  void _startListening() {
    _controller.addListener(() {
      if (!mounted) return;
      final newPosition = _controller.value.position;
      if (newPosition != _currentPosition) {
        setState(() {
          _currentPosition = newPosition;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_startListening);
    _controller.dispose();
    super.dispose();
  }

  void _onProgressChanged(double value) {
    final position = Duration(
      milliseconds: (value * _totalDuration.inMilliseconds).round(),
    );
    _controller.seekTo(position);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return '$hours:$minutes:$seconds';
    } else {
      return '$minutes:$seconds';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 视频区域
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(
                      height: 200,
                      color: Colors.grey[800],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
            ),
            const SizedBox(height: 12),
            // 进度条 + 时间
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  // 进度条
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.grey[600],
                      thumbColor: Colors.blue,
                      overlayColor: Colors.blue,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 8,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 16,
                      ),
                    ),
                    child: Slider(
                      value: _totalDuration.inMilliseconds == 0
                          ? 0
                          : _currentPosition.inMilliseconds /
                                _totalDuration.inMilliseconds,
                      onChanged: (value) {
                        setState(() {
                          _onProgressChanged(value);
                        });
                      },
                    ),
                  ),
                  // 视频时长
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_currentPosition),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        _formatDuration(_totalDuration),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // 播放/暂停 + 关闭按钮
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                      _isPlaying = !_isPlaying;
                    });
                  },
                ),
                // 退出按钮
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
