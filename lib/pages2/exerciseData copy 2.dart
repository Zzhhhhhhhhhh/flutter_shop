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
      body: Column(
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
          // 内容
          Expanded(
            child: Stack(
              children: [
                // ✅ 方案1：用 Positioned.fill 包裹 PageView
                Positioned.fill(
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        // ✅ 确保内容不会撑开无限高
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // 避免 Column 自动拉伸
                          children: [_CommonHead()],
                        ),
                      ),
                    ],
                  ),
                ),

                // 小圆点
                Positioned(
                  right: 20,
                  top: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    children: List.generate(2, (index) {
                      return GestureDetector(
                        child: Container(
                          width: 10,
                          height: 10,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 头部
class _CommonHead extends StatefulWidget {
  const _CommonHead({super.key});

  @override
  State<_CommonHead> createState() => __CommonHeadState();
}

class __CommonHeadState extends State<_CommonHead> {
  // 当前选中的学期
  String selectedTerm = "2025上半学期";
  List<String> terms = ["2025上半学期", "2025下半学期", "2024上半学期", "2024下半学期"];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 背景图
        Positioned.fill(
          child: Image.asset("assets/images/student.png", fit: BoxFit.cover),
        ),
        // 内容区域
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Container(
            height: 215,
            decoration: BoxDecoration(
              color: Color.fromRGBO(33, 150, 243, 0.7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 25, left: 30, right: 40),
              child: Column(
                children: [
                  // 姓名 年龄
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  "assets/images/profile.jpg",
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    "X X X",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("性别：男", style: TextStyle(fontSize: 12)),
                                  Text(
                                    "年龄：10岁",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "学号：202615689",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "班级：四年三班",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // 数据
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  _buildDataItem("身高①", "150cm"),
                                  _buildDataItem("体重①", "60kg"),
                                  _buildDataItem("本学期测评次数", "--次"),
                                  _buildDataItem("总平均分", "--"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // 右
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "学期选择",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              // 下拉框
                              SizedBox(
                                width: 160, // 控制下拉框宽度
                                child: DropdownButtonFormField<String>(
                                  value: selectedTerm,
                                  onChanged: (String? newValue) {
                                    print(newValue);
                                  },
                                  items: terms.map((term) {
                                    return DropdownMenuItem(
                                      value: term,
                                      child: Text(
                                        term,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    labelStyle: TextStyle(color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  dropdownColor: Colors.blue[50], // 下拉菜单背景色
                                  iconEnabledColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildDataItem(String title, String value) {
  return Container(
    margin: EdgeInsets.only(right: 50),
    child: Column(
      children: [
        Text(title, style: TextStyle(fontSize: 12, color: Colors.white)),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
