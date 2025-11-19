import 'package:flutter/material.dart';

class TestRecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            // 左侧菜单栏（固定宽度）
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 70,
                  children: [
                    _buildMenuItem('座位体前屈', Icons.run_circle, true),
                    _buildMenuItem('仰卧起坐', Icons.report, false),
                    _buildMenuItem('引体向上', Icons.accessibility_new, false),
                    _buildMenuItem('一分钟跳绳', Icons.rocket, false),
                    _buildMenuItem('立定跳远', Icons.directions_run, false),
                  ],
                ),
              ),
            ),

            // 右侧内容区（可滚动）
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 表头 —— 固定列宽，居中显示
                    _buildTableRow(
                      columns: ['姓名', '性别', '班级', '成绩', '时间', '评分', '查看'],
                      isHeader: true,
                    ),

                    SizedBox(height: 16),

                    // 数据行（模拟）
                    ...List.generate(18, (index) {
                      return _buildTableRow(
                        columns: [
                          '游客1',
                          '--',
                          '一年2班',
                          '6.9cm',
                          '2025-10-30 12:30:30',
                          '70',
                          '锻炼报告',
                        ],
                        isHeader: false,
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, bool isSelected) {
    return Padding(
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
    );
  }

  Widget _buildTableRow({
    required List<String> columns,
    required bool isHeader,
  }) {
    final List<Widget> cells = [];
    final List<double> widths = [100, 80, 100, 100, 140, 80, 100]; // 手动设置每列宽度

    for (int i = 0; i < columns.length; i++) {
      final String text = columns[i];
      final double width = widths[i];

      cells.add(
        SizedBox(
          width: width,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isHeader ? Colors.white : Colors.white,
                fontSize: isHeader ? 14 : 12,
                fontWeight: isHeader ? FontWeight.bold : null,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      if (i < columns.length - 1) {
        cells.add(SizedBox(width: 8)); // 列间距
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue[900] : Colors.blue[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: cells),
    );
  }
}
