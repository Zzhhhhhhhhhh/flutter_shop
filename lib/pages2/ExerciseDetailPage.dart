// 运动记录
import 'package:flutter/material.dart';
import '../components//ExerciseDetail/MainContent.dart';
import '../components//ExerciseDetail/Fotter.dart';

class ExerciseDetailPage extends StatefulWidget {
  const ExerciseDetailPage({super.key});

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  // 背景
  Widget _buildPageBackguoundImg() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/default.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 标题
  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 70),
      child: Row(
        children: [
          Icon(Icons.assessment, size: 55, color: Colors.white),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "锻炼报告",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontFamily: "Montserrat",
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 背景
            _buildPageBackguoundImg(),
            // 内容
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  // Header
                  _buildTitle(),
                  // Content
                  Padding(
                    padding: const EdgeInsets.only(left: 45, right: 45),
                    child: MainContent(),
                  ),
                  SizedBox(height: 30),
                  // Footer
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: FotterContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
