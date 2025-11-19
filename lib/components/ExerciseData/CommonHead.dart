import 'package:flutter/material.dart';

// 头部
class CommonHead extends StatefulWidget {
  const CommonHead({super.key});

  @override
  State<CommonHead> createState() => __CommonHeadState();
}

class __CommonHeadState extends State<CommonHead> {
  // 当前选中的学期
  String selectedTerm = "2025上半学期";
  List<String> terms = ["2025上半学期", "2025下半学期", "2024上半学期", "2024下半学期"];
  @override
  Widget build(BuildContext context) {
    return Container(
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
                          ClipOval(
                            child: Image.asset(
                              "assets/images/profile.jpg",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "X X X",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("性别：男", style: TextStyle(fontSize: 14)),
                                Text("年龄：10岁", style: TextStyle(fontSize: 14)),
                                Text(
                                  "学号：202615689",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text("班级：四年三班", style: TextStyle(fontSize: 14)),
                              ],
                            ),
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
                      margin: EdgeInsets.only(top: 10),
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
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.3),
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.white),
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
