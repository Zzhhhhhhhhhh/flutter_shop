// 运动排行榜
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class ExercoseRankListPage extends StatefulWidget {
  const ExercoseRankListPage({super.key});

  @override
  State<ExercoseRankListPage> createState() => _ExercoseRankListPageState();
}

class _ExercoseRankListPageState extends State<ExercoseRankListPage> {
  late Timer _timer;
  String formattedTime = '';
  @override
  void initState() {
    super.initState();
    // 在初始化时隐藏状态栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // 初始化时先显示一次当前时间
    _updateTime();
    // 每隔1秒更新一次时间
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final timeStr =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} '
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    // 触发 UI 更新
    setState(() {
      formattedTime = timeStr;
    });
  }

  @override
  void dispose() {
    // 在页面销毁时重置状态栏
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    // 页面销毁时取消定时器
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //背景图
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/gymnasium.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            //顶部菜单
            Container(
              height: 110,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.7),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // 左侧
                  Container(
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/images/profile.jpg",
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "xx学校",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff010202),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 中部
                  Text(
                    formattedTime,
                    style: TextStyle(fontSize: 24, color: Color(0xff010202)),
                  ),
                  // 右侧
                  Container(
                    child: Row(
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
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Text(
                            "|",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff010202),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        // 登录
                        GestureDetector(
                          child: Container(
                            width: 135,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Color(0xff010202), // 边框颜色
                                width: 2.0, // 边框宽度
                              ),
                            ),
                            child: Text(
                              "登录",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff010202),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.settings,
                              size: 40,
                              color: Color(0xff010202),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 切换按钮
            Container(
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    top: 0,
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/arrowsLeft.png",
                      width: 100,
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 0,
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/arrowsRight.png",
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
            // 内容区域
            SizedBox(height: 70),
            ExerciseRankingList(),
          ],
        ),
      ),
    );
  }
}

// 运动排行榜
class ExerciseRankingList extends StatefulWidget {
  const ExerciseRankingList({super.key});

  @override
  State<ExerciseRankingList> createState() => _ExerciseRankingListState();
}

class _ExerciseRankingListState extends State<ExerciseRankingList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/medal.png", width: 125, fit: BoxFit.cover),
          Container(
            margin: EdgeInsets.only(left: 10, right: 20),
            child: Text(
              "运动排行榜",
              style: TextStyle(
                fontSize: 96,
                fontWeight: FontWeight.w600,
                color: Color(0xffF3B955),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Image.asset("assets/images/medal.png", width: 125, fit: BoxFit.cover),
        ],
      ),
    );
  }
}

// 活跃排行榜
class ActiveRankingList extends StatefulWidget {
  const ActiveRankingList({super.key});

  @override
  State<ActiveRankingList> createState() => _ActiveRankingListState();
}

class _ActiveRankingListState extends State<ActiveRankingList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
