import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseLogPage extends StatefulWidget {
  const ExerciseLogPage({super.key});

  @override
  State<ExerciseLogPage> createState() => _ExerciseLogPageState();
}

class _ExerciseLogPageState extends State<ExerciseLogPage> {
  // 当前选中的测试项目
  String _selectedItem = '座位体前屈';

  // 菜单项
  final List<String> _menuItems = ['座位体前屈', '仰卧起坐', '引体向上', '一分钟跳绳', '立定跳远'];

  // 菜单图标映射
  final Map<String, IconData> _iconMap = {
    '座位体前屈': Icons.run_circle,
    '仰卧起坐': Icons.report,
    '引体向上': Icons.accessibility_new,
    '一分钟跳绳': Icons.rocket,
    '立定跳远': Icons.directions_run,
  };

  // 模拟数据
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
        child: ClipPath(
          clipper: ArrowClipper(), // 👈 自定义箭头剪裁器
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: isSelected
                ? BoxDecoration(color: Color(0xff3A3DF3))
                : BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 28),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
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
        color: Color(0xff0C0D8A),
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
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  // 表格行
  Widget _buildTableRow(ExerciseRecord item, int index) {
    return Container(
      margin: EdgeInsets.only(top: 5), // 行间隔
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _buildDataCell(item.name, 1),
          _buildDataCell(item.gender, 1),
          _buildDataCell(item.classAvg, 1),
          _buildDataCell(item.score, 1),
          _buildDataCell(item.testTime, 2),
          _buildDataCell(item.gradeMark.toString(), 1),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
               Get.toNamed("/exerciseDetail");
              },
              child: Text(
                "锻炼报告",
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
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
                      // 右侧表格区域
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                // 固定表头
                                _buildTableHeader(),
                                // 可滚动的内容区域
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: _records.length,
                                    itemBuilder: (context, index) {
                                      return _buildTableRow(
                                        _records[index],
                                        index,
                                      );
                                    },
                                    // 可选：提升滚动性能
                                    cacheExtent: 500, // 预加载更多区域
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

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    // 让箭头更“收一点”，减小三角区域
    double arrowStartX = width * 0.85; // 👈 从 0.7 → 0.85（值越大，箭头越短）
    double tipX = width; // 箭头顶点仍在最右边
    double tipY = height * 0.5; // 垂直居中

    path.moveTo(0, 0);
    path.lineTo(0, height);
    path.lineTo(arrowStartX, height); // 右下起点
    path.lineTo(tipX, tipY); // 尖端顶点
    path.lineTo(arrowStartX, 0); // 右上起点
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
