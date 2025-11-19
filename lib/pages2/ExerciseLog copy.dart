import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class ExerciseLogPage extends StatefulWidget {
  const ExerciseLogPage({super.key});

  @override
  State<ExerciseLogPage> createState() => _ExerciseLogPageState();
}

class _ExerciseLogPageState extends State<ExerciseLogPage> {
  // 当前选中的测试项目
  String _selectedItem = '座位体前屈';

  // 所有可选项（用于构建菜单）
  final List<String> _menuItems = ['座位体前屈', '仰卧起坐', '引体向上', '一分钟跳绳', '立定跳远'];

  // 图标映射
  final Map<String, IconData> _iconMap = {
    '座位体前屈': Icons.run_circle,
    '仰卧起坐': Icons.report,
    '引体向上': Icons.accessibility_new,
    '一分钟跳绳': Icons.rocket,
    '立定跳远': Icons.directions_run,
  };

  // 体测数据模拟
  final List<ExerciseRecord> _records = [
    ExerciseRecord(
      name: '游客1',
      gender: "男",
      classAvg: "一年二班",
      score: 50,
      testTime: "2021-05-01 10:00:00",
      gradeMark: 95,
    ),
    ExerciseRecord(
      name: '游客2',
      gender: "男",
      classAvg: "一年二班",
      score: 50,
      testTime: "2021-05-01 10:00:00",
      gradeMark: 95,
    ),
    ExerciseRecord(
      name: '游客3',
      gender: "男",
      classAvg: "一年二班",
      score: 50,
      testTime: "2021-05-01 10:00:00",
      gradeMark: 95,
    ),
  ];

  // 背景
  Widget _buildPageBackguoundImg() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/default.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 标题
  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 70),
      child: Row(
        children: [
          Icon(Icons.assignment, size: 55, color: Colors.white),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "测试记录",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontFamily: "Montserrat",
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 菜单
  Widget _buildMenuItem(String title, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = title;
          // 表格数据会自动刷新，因为 _selectedItem 变了
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: isSelected
              ? BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                )
              : BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(title, style: TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  //表头
  Widget _buildListHeader(String title) {
    return Container(
      height: 40,
      // color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 13,
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
            // 背景
            _buildPageBackguoundImg(),
            // 内容
            Column(
              children: [
                SizedBox(height: 40),
                // Header
                _buildTitle(),
                // Content
                Expanded(
                  child: Row(
                    children: [
                      // 左侧菜单栏
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 70,
                            children: _menuItems.map((item) {
                              return _buildMenuItem(
                                item,
                                _iconMap[item]!,
                                item == _selectedItem,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      // 右侧列表
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: DataTable2(
                            decoration: BoxDecoration(
                              color: Colors.transparent, // 确保背景透明
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0,
                              ), // 无边框
                            ),
                            fixedTopRows: 1,
                            columnSpacing: 0, // 列间距
                            horizontalMargin: 0, // 水平边距
                            dividerThickness: 0, // ← 这个很重要！
                            headingRowHeight: 50,
                            headingRowDecoration: BoxDecoration(
                              color: Colors.blue.shade900,

                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            // 列定义 - 居中对齐
                            columns: [
                              DataColumn2(
                                label: _buildListHeader('姓名'),
                                size: ColumnSize.S,
                              ),
                              DataColumn2(
                                label: _buildListHeader('性别'),
                                size: ColumnSize.S,
                              ),
                              DataColumn2(
                                label: _buildListHeader('班级'),
                                size: ColumnSize.S,
                              ),
                              DataColumn2(
                                label: _buildListHeader('成绩'),
                                size: ColumnSize.S,
                              ),
                              DataColumn2(
                                label: _buildListHeader('时间'),
                                size: ColumnSize.L,
                              ),
                              DataColumn2(
                                label: _buildListHeader('评分'),
                                size: ColumnSize.S,
                              ),
                              DataColumn2(
                                label: _buildListHeader('查看'),
                                size: ColumnSize.S,
                              ),
                            ],
                            // 行数据 - 居中对齐
                            rows: _records.map((record) {
                              return DataRow2(
                                color: WidgetStateColor.resolveWith(
                                  (states) => Colors.blue.shade700,
                                ),
                                cells: [
                                  // 姓名
                                  DataCell(
                                    Container(
                                      margin: EdgeInsets.only(top: 8), // 行上间距
                                      child: Center(
                                        child: Text(
                                          record.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // 性别
                                  DataCell(
                                    Center(
                                      child: Text(
                                        record.gender,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // 班级
                                  DataCell(
                                    Center(
                                      child: Text(
                                        record.classAvg,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // 成绩
                                  DataCell(
                                    Center(
                                      child: Text(
                                        record.score.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // 时间
                                  DataCell(
                                    Center(
                                      child: Text(
                                        record.testTime,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // 评分
                                  DataCell(
                                    Center(
                                      child: Text(
                                        record.gradeMark.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // 查看
                                  DataCell(
                                    Center(
                                      child: Text(
                                        "锻炼报告",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
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
    );
  }
}

// 数据模型
class ExerciseRecord {
  final String name; // 姓名
  final String gender; // 性别
  final String classAvg; // 班级
  final int score; // 成绩
  final String testTime; // 考试时间
  final int gradeMark; // 评分

  ExerciseRecord({
    required this.name,
    required this.gender,
    required this.classAvg,
    required this.score,
    required this.testTime,
    required this.gradeMark,
  });
}
