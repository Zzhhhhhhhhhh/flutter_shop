import 'package:flutter/material.dart';

// 运动数据
class ExerciseDataPage extends StatefulWidget {
  const ExerciseDataPage({super.key});

  @override
  State<ExerciseDataPage> createState() => _ExerciseDataPageState();
}

class _ExerciseDataPageState extends State<ExerciseDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            child: Column(
              children: [
                // 顶部
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  height: 85,
                  color: Color(0xffFFFFFF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/quit.png",
                            width: 48,
                            height: 48,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "退出登录",
                              style: TextStyle(
                                fontSize: 36,
                                color: Color(0xff3D3D3D),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          //锻炼记录
                          GestureDetector(
                            child: Container(
                              width: 135,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Color(0xff002AFC), // 边框颜色
                                  width: 2.0, // 边框宽度
                                ),
                              ),
                              child: Text(
                                "锻炼记录",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff002AFC),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          // 头像
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/profile.jpg",
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "x x x",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xff3D3D3D),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 内容
        ],
      ),
    );
  }
}
