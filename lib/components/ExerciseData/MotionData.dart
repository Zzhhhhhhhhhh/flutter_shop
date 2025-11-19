// 运动数据
import 'package:flutter/material.dart';
import '../ExerciseData/CommonHead.dart';
import 'FixedTable.dart';

class MotionData extends StatefulWidget {
  const MotionData({super.key});

  @override
  State<MotionData> createState() => _MotionDataState();
}

class _MotionDataState extends State<MotionData> {
  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        children: [
          Image.asset("assets/images/clover.png", width: 23, height: 23),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "运动数据",
              style: TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/student.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // 公共头部
          CommonHead(),
          // 间隔
          SizedBox(height: 20),
          // 标题
          _buildTitle(),
          // 间隔
          SizedBox(height: 10),
          // 表格
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: FixedTablePage(),
            ),
          ),
        ],
      ),
    );
  }
}
