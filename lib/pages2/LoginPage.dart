//登录
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _ExercoseRankListPageState();
}

class _ExercoseRankListPageState extends State<LoginPage> {
  final TextEditingController _controllerAdmin = TextEditingController();
  final TextEditingController _controllerPassWord = TextEditingController();
  bool _isPasswordVisible = false; // 默认隐藏
  @override
  void initState() {
    super.initState();
    // 在初始化时隐藏状态栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    // 在页面销毁时重置状态栏
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: SystemUiOverlay.values,
    // );
    _controllerAdmin.dispose();
    _controllerPassWord.dispose();
    super.dispose();
  }

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

  // 用户名
  Widget _buildUserName() {
    return TextField(
      controller: _controllerAdmin,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Colors.purple),
        hintText: "输入您的账号",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xff502BE5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xff502BE5)),
        ),
      ),
    );
  }

  // 密码
  Widget _buildPassWord() {
    return TextField(
      controller: _controllerPassWord,
      obscureText: !_isPasswordVisible, // 隐藏密码 true隐藏 false显示
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Colors.purple),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.purple,
          ),
          onPressed: () {
            // 切换密码可见性
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          }, // 显示/隐藏密码
        ),
        hintText: "输入您的密码",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xff502BE5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xff502BE5)),
        ),
      ),
      // 监听输入
      onChanged: (value) {},
      // 监听提交
      onSubmitted: (value) {},
    );
  }

  // 登录按钮
  Widget _buildLoginButton() {
    return GestureDetector(
      onTap: () {
        print("用户名：${_controllerAdmin.text} 密码：${_controllerPassWord.text}");
        Get.toNamed("/exerciseData");
      },
      child: Container(
        width: double.infinity,
        // height: 85,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFB8F66), Color(0xff7033FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "登录",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // 人脸登录
  Widget _buildFaceLoginButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/faceLogin");
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff33BEFF), Color(0xff6675FB)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/face.png", width: 30),
            SizedBox(width: 8),
            Text(
              "人脸登录",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
                                // 用户名
                                SizedBox(height: 40),
                                _buildUserName(),
                                // 密码
                                SizedBox(height: 40),
                                _buildPassWord(),
                                // 登录按钮
                                SizedBox(height: 40),
                                _buildLoginButton(),
                                // 人脸登录
                                SizedBox(height: 40),
                                _buildFaceLoginButton(),
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
