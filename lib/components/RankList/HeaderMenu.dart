import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class HeaderMenu extends StatefulWidget {
  const HeaderMenu({super.key});

  @override
  State<HeaderMenu> createState() => _HeaderMenuState();
}

class _HeaderMenuState extends State<HeaderMenu> {
  late Timer _timer;
  String formattedTime = '';

  // 初始化
  @override
  void initState() {
    super.initState();
    // 初始化时先显示一次当前时间
    _updateTime();
    // 每隔1秒更新一次时间
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  // 销毁时停止计时器
  @override
  void dispose() {
    // 页面销毁时取消定时器
    _timer.cancel();
    super.dispose();
  }

  // 定时更新时间
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
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.7)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    onTap: () {
                      Get.toNamed("/exerciseLog");
                    },
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
                    onTap: () {
                      Get.toNamed("/login");
                    },
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
    );
  }
}
