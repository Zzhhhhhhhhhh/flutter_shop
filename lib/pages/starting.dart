import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景图片
          Positioned.fill(
            child: Image.asset(
              "assets/images/shopping2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // 黑色遮罩
          Positioned(child: Container(color: Colors.black26)),
          // 内容
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  // logo
                  'assets/images/logo.png',
                  width: 260,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                // 文字
                Text(
                  'always care customers',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // 按钮
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {
                    Get.offAllNamed("/tabs");
                  },
                  child: Text(
                    "Go Shopping",
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontFamily: "Montserrat",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
