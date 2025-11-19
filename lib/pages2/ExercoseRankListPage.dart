// 运动排行榜
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../components/RankList/HeaderMenu.dart';
import '../components/RankList/ExerciseRankingList.dart';
import '../components/RankList/ActiveRankingList.dart';

class ExercoseRankListPage extends StatefulWidget {
  const ExercoseRankListPage({super.key});

  @override
  State<ExercoseRankListPage> createState() => _ExercoseRankListPageState();
}

class _ExercoseRankListPageState extends State<ExercoseRankListPage> {
  late PageController _pageController;
  int _currentPageIndex = 0; // 可选：用于跟踪当前页
  @override
  void initState() {
    super.initState();
    // 在初始化时隐藏状态栏
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    // 初始化 PageController
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // 在页面销毁时重置状态栏
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: SystemUiOverlay.values,
    // );
    _pageController.dispose(); //释放控制器
    super.dispose();
  }

  // 构建背景图片
  Widget _buildPageBackguoundImg() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/gymnasium.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 左侧按钮
  Widget _buildLeftButton() {
    return Positioned(
      left: 30,
      top: MediaQuery.sizeOf(context).height * 0.5,
      child: GestureDetector(
        onTap: () {
          final newIndex = _currentPageIndex == 0 ? 1 : 0;
          setState(() {
            _currentPageIndex = newIndex;
          });
          _pageController.animateToPage(
            newIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Image.asset("assets/images/arrowsLeft.png", width: 100),
      ),
    );
  }

  // 右侧按钮
  Widget _buildRightButton() {
    return Positioned(
      right: 30,
      top: MediaQuery.sizeOf(context).height * 0.5,
      child: GestureDetector(
        onTap: () {
          final newIndex = _currentPageIndex == 0 ? 1 : 0;
          setState(() {
            _currentPageIndex = newIndex;
          });
          _pageController.animateToPage(
            newIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Image.asset("assets/images/arrowsRight.png", width: 100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //背景图
          _buildPageBackguoundImg(),
          // 主体内容
          SingleChildScrollView(
            child: Column(
              children: [
                //顶部菜单
                HeaderMenu(),
                // PageView
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: math.max(0, MediaQuery.of(context).size.height - 180),
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    children: [
                      ExerciseRankingList(), // 运动排行榜
                      ActiveRankingList(), // 活跃排行榜
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 左侧切换按钮
          _buildLeftButton(),
          // 右侧切换按钮
          _buildRightButton(),
        ],
      ),
    );
  }
}
