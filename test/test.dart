import 'package:flutter/material.dart';

void main() {
  runApp(const VideoPlaybackApp());
}

class VideoPlaybackApp extends StatelessWidget {
  const VideoPlaybackApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: VideoPlaybackPage());
  }
}

class VideoPlaybackPage extends StatelessWidget {
  const VideoPlaybackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('视频回放'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 左侧：视频播放器（固定宽度）
            Container(
              width: 240, // 固定宽度
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.play_circle_outline,
                    size: 50,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.play_arrow, size: 12),
                      const SizedBox(width: 4),
                      const Text('00:12', style: TextStyle(fontSize: 10)),
                      const SizedBox(width: 10),
                      Container(
                        width: 100,
                        height: 4,
                        color: Colors.grey[400],
                        child: Container(
                          width: 40,
                          height: 4,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('01:54:38', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),

            // 右侧：关键动作抓拍（横向滚动）
            const SizedBox(width: 16), // 左右间距
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 横向滚动
                child: Row(
                  children: [
                    _buildActionCard('预摆', Icons.camera_alt),
                    _buildActionCard('起跳', Icons.camera_alt),
                    _buildActionCard('腾空', Icons.camera_alt),
                    _buildActionCard('落地', Icons.camera_alt),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(String label, IconData icon) {
    return Container(
      width: 160,
      height: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.grey[500]),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }
}
