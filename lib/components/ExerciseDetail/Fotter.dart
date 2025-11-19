import 'package:flutter/material.dart';
import 'PlayVideo.dart';

class FotterContent extends StatefulWidget {
  const FotterContent({super.key});

  @override
  State<FotterContent> createState() => _FotterContentState();
}

class _FotterContentState extends State<FotterContent> {
  // 头部
  Widget _buildHeader({
    required IconData icon,
    required Color iconColor,
    required String title,
  }) {
    return Row(
      children: [
        Icon(icon, size: 38, color: iconColor),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text(
            title,
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 视频回放
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _buildHeader(
                icon: (Icons.camera_alt_outlined),
                iconColor: Colors.orange,
                title: "视频回放",
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  final videoUrl =
                      'http://192.168.1.235:8000/video/2025/11/11/142534/PGM/Video1.mp4';
                  showVideoPreviewDialog(context, videoUrl);
                },
                child: Container(
                  height: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/images/videoCover.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        // 关键动作抓拍
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buildHeader(
                icon: (Icons.photo),
                iconColor: Colors.red,
                title: "关键动作抓拍",
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                height: 165,
                decoration: BoxDecoration(
                  color: Color(0xff1819CE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xffff9800),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      child: Text("第${index + 1}张图片"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
