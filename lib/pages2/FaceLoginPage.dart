// 人脸登录
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaceLoginPage extends StatefulWidget {
  const FaceLoginPage({super.key});

  @override
  State<FaceLoginPage> createState() => _FaceLoginPageState();
}

class _FaceLoginPageState extends State<FaceLoginPage> {
  //背景图
  Widget _buildPageBackguoundImg() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/school.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 返回按钮
  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: EdgeInsets.only(left: 50, top: 20),
        width: 200,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromRGBO(255, 255, 255, 0.6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/back.png", width: 35),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "返回",
                style: TextStyle(
                  fontSize: 34,
                  color: Color(0xff3D3D3D),
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 标题
  _buildTitle() {
    return Text.rich(
      TextSpan(
        text: "欢迎使用",
        style: TextStyle(
          color: Color(0xff3D3D3D),
          fontSize: 64,
          fontFamily: "Montserrat",
        ),
        children: [
          TextSpan(
            text: "AI一体机",
            style: TextStyle(
              color: Color(0xff516FEA),
              fontSize: 64,
              fontFamily: "Montserrat",
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
            //背景图
            _buildPageBackguoundImg(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 返回按钮
                  _buildBackButton(),
                  SizedBox(height: 50),
                  // 内容
                  Center(
                    child: Container(
                      width: 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          // 标题
                          _buildTitle(),
                          Container(
                            padding: EdgeInsets.only(left: 70, right: 70),
                            child: Column(
                              children: [
                                SizedBox(height: 40),
                                //取景框
                                Container(
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(150),
                                    color: Color(0xff4fc3f7),
                                  ),
                                ),
                                // 文字
                                SizedBox(height: 20),
                                Text(
                                  "请保持完整正面在取景框内",
                                  style: TextStyle(
                                    fontSize: 38,
                                    color: Color(0xff3D3D3D),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                SizedBox(height: 40),
                                //结束
                              ],
                            ),
                          ),
                        ],
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
