// 运动趋势
import 'package:flutter/material.dart';
import '../ExerciseData/CommonHead.dart';
import 'BarChart.dart';
import 'LineChart.dart';

class MotionTrend extends StatefulWidget {
  const MotionTrend({super.key});

  @override
  State<MotionTrend> createState() => _MotionTrendState();
}

class _MotionTrendState extends State<MotionTrend> {
  // 背景
  Widget _buildPageBackguoundImg() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/student.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 标题
  Widget _buildTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 28, color: Colors.blue),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xff3D3D3D),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 背景
        _buildPageBackguoundImg(),
        // 内容
        Column(
          children: [
            // 头部
            CommonHead(),
            // 间隔
            SizedBox(height: 20),
            // 标题
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        _buildTitle(Icons.trending_up, "运动趋势"),
                        SizedBox(height: 20),
                        ExerciseLineChart(),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        _buildTitle(Icons.fitness_center, "课后锻炼"),
                        SizedBox(height: 20),
                        ExerciseChart(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
