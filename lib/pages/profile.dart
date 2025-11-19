import 'package:flutter/material.dart';

class ProFilePage extends StatefulWidget {
  const ProFilePage({super.key});

  @override
  State<ProFilePage> createState() => _ProFilePageState();
}

class _ProFilePageState extends State<ProFilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/title.png", width: 120),
      ),
      body: Center(
        child: Container(
          width: 375,
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 上
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 头像
                  Container(
                    child: Image.asset(
                      "assets/images/profile.png",
                      fit: BoxFit.cover,
                      width: 250,
                    ),
                  ),
                  // 社交信息
                  Container(
                    height: 210,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(
                                Icons.facebook,
                                size: 16,
                                color: Color(0xff222222),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Facebook",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff222222),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 16,
                                color: Color(0xff222222),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Instagram",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff222222),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.send,
                                size: 16,
                                color: Color(0xff222222),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Twitter",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff222222),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // 中
              // SizedBox(height: 15),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 39),
                child: Text(
                  "Jessica Humpston",
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Color(0xff365099),
                    height: 42 / 48,
                  ),
                ),
              ),
              SizedBox(height: 18),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 39),
                child: Text(
                  "Fashion Designer",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    color: Color(0xff222222),
                  ),
                ),
              ),
              // 下
              Container(
                height: 200,
                padding: EdgeInsets.only(left: 20),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        "assets/images/shopping.png",
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        "Look Jessica’s Shop",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff222222),
                        ),
                      ),
                      subtitle: Text(
                        "Jessica’s House",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/images/thumbs-up.png",
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        "Reviews",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff222222),
                        ),
                      ),
                      subtitle: Text(
                        "1456 Reviews for Jessica’s House",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/images/at-sign.png",
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        "Contact",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff222222),
                        ),
                      ),
                      subtitle: Text(
                        "All contact information",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/images/question.png",
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        "FFQ",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff222222),
                        ),
                      ),
                      subtitle: Text(
                        "Ask anything what you want. ",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
