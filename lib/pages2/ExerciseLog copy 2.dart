import 'package:flutter/material.dart';

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

  // 模拟从服务器获取的数据
  final List<ExerciseRecord> _records = [
    ExerciseRecord(
      name: '游客1',
      gender: "--",
      classAvg: "--",
      score: "6.9cm",
      testTime: "2025-10-30 12:30:30",
      gradeMark: 70,
    ),
    ExerciseRecord(
      name: 'XXX',
      gender: "男",
      classAvg: "一年2班",
      score: "12.7cm",
      testTime: "2025-10-30 12:30:30",
      gradeMark: 95,
    ),
    ExerciseRecord(
      name: '游客1',
      gender: "--",
      classAvg: "--",
      score: "6.9cm",
      testTime: "2025-10-30 12:30:30",
      gradeMark: 70,
    ),
    ExerciseRecord(
      name: '游客1',
      gender: "--",
      classAvg: "--",
      score: "6.9cm",
      testTime: "2025-10-30 12:30:30",
      gradeMark: 70,
    ),
    ExerciseRecord(
      name: '游客1',
      gender: "--",
      classAvg: "--",
      score: "6.9cm",
      testTime: "2025-10-30 12:30:30",
      gradeMark: 70,
    ),
    ExerciseRecord(
      name: '游客1',
      gender: "--",
      classAvg: "--",
      score: "6.9cm",
      testTime: "2025-10-30 12:30:30",
      gradeMark: 70,
    ),
    ExerciseRecord(
      name: '游客1',
      gender: "--",
      classAvg: "--",
      score: "6.9cm",
      testTime: "2025-10-30 12:30:30",
      gradeMark: 70,
    ),
  ];

  // 背景
  Widget _buildPageBackguoundImg() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
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
          const Icon(Icons.assignment, size: 55, color: Colors.white),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text(
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
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 表头
  Widget _buildTableHeader() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          _buildHeaderCell('姓名', 1),
          _buildHeaderCell('性别', 1),
          _buildHeaderCell('班级', 1),
          _buildHeaderCell('成绩', 1),
          _buildHeaderCell('时间', 2),
          _buildHeaderCell('评分', 1),
          _buildHeaderCell('查看', 1),
        ],
      ),
    );
  }

  // 表头单元格
  Widget _buildHeaderCell(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // 表格行
  Widget _buildTableRow(ExerciseRecord record, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: index.isEven ? Colors.blue.shade700 : Colors.blue.shade800,
      ),
      child: Row(
        children: [
          _buildDataCell(record.name, 1),
          _buildDataCell(record.gender, 1),
          _buildDataCell(record.classAvg, 1),
          _buildDataCell(record.score, 1),
          _buildDataCell(record.testTime, 2),
          _buildDataCell(record.gradeMark.toString(), 1),
          _buildDataCell("锻炼报告", 1),
        ],
      ),
    );
  }

  // 数据单元格
  Widget _buildDataCell(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
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
                const SizedBox(height: 40),
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
                      // 右侧表格区域
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // 固定表头
                                _buildTableHeader(),
                                // 可滚动的内容区域
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          // 表格内容
                                          ..._records.asMap().entries.map((
                                            entry,
                                          ) {
                                            return _buildTableRow(
                                              entry.value,
                                              entry.key,
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
  final String score; // 成绩
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
