import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/ExerciseData/MotionData.dart';
import '../components/ExerciseData/MotionTrend.dart';

// 运动数据
class ExerciseDataPage extends StatefulWidget {
  const ExerciseDataPage({super.key});

  @override
  State<ExerciseDataPage> createState() => _ExerciseDataPageState();
}

class _ExerciseDataPageState extends State<ExerciseDataPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  // 头部
  Widget _buildHead() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      height: 85,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.offAllNamed("/exerciseRankList");
            },
            child: Row(
              children: [
                Image.asset("assets/images/quit.png", width: 48, height: 48),
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
    );
  }

  // 小圆点
  Widget _buildDots() {
    return Positioned(
      right: 20,
      top: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: List.generate(2, (index) {
          return GestureDetector(
            onTap: () {
              print("点击小圆点");
              // 点击小圆点切换页面
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              width: 18,
              height: 18,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 顶部
          _buildHead(),
          // 内容
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    children: [
                      MotionData(), //运动数据
                      MotionTrend(), //运动趋势
                    ],
                    onPageChanged: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                  ),
                ),
                // 小圆点
                _buildDots(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
