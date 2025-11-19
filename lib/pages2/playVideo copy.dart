import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewButton extends StatelessWidget {
  const VideoPreviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showVideoDialog(context),
      child: const Text('预览视频'),
    );
  }

  void _showVideoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const VideoDialog(),
    );
  }
}

class VideoDialog extends StatefulWidget {
  const VideoDialog({super.key});

  @override
  State<VideoDialog> createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // 👇 替换为你的视频地址
  final String videoUrl =
      'http://192.168.1.235:8000//video/2025/11/11/142534/PGM/Video1.mp4';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
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
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ), // ← 控制不占满屏
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5, // 最大宽度 90%
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
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.grey[600],
                      thumbColor: Colors.blue,
                      overlayColor: Colors.blue.withOpacity(0.2),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_currentPosition),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        _formatDuration(_totalDuration),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
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
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
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
