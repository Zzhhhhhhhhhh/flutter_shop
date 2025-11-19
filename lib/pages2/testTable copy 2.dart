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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 40),
              child: Row(
                children: [
                  Icon(Icons.analytics, color: Colors.white, size: 50),
                  Text(
                    "测试记录",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
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
                          _buildMenuItem(
                            '引体向上',
                            Icons.accessibility_new,
                            false,
                          ),
                          _buildMenuItem('一分钟跳绳', Icons.rocket, false),
                          _buildMenuItem('立定跳远', Icons.directions_run, false),
                        ],
                      ),
                    ),
                  ),
                  // 右侧内容区 —— 使用 CustomScrollView 实现固定表头
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        // 固定表头
                        SliverPersistentHeader(
                          pinned: true, // 关键：固定在顶部
                          delegate: _TableHeaderDelegate(),
                        ),

                        // 数据内容
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              return _buildDataRow(index);
                            }, childCount: 18),
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

  Widget _buildDataRow(int index) {
    final List<double> widths = [120, 80, 120, 120, 160, 80, 140];
    final List<String> data = [
      '游客$index',
      '--',
      '一年${(index % 5) + 1}班',
      '${6.9 + index * 0.5}cm',
      '2025-10-30 12:${(30 + index).toString().padLeft(2, '0')}:30',
      '${70 + index}',
      '锻炼报告',
    ];

    final cells = <Widget>[];
    for (int i = 0; i < data.length; i++) {
      cells.add(
        SizedBox(
          width: widths[i],
          child: Center(
            child: Text(
              data[i],
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
      if (i < data.length - 1) cells.add(SizedBox(width: 8));
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: cells),
    );
  }
}

// 表头代理类
class _TableHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<double> _widths = [125, 85, 125, 125, 165, 80, 140];
  final List<String> _headers = ['姓名', '性别', '班级', '成绩', '时间', '评分', '查看'];

  @override
  double get minExtent => 48;
  @override
  double get maxExtent => 48;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final cells = <Widget>[];
    for (int i = 0; i < _headers.length; i++) {
      cells.add(
        SizedBox(
          width: _widths[i],
          child: Center(
            child: Text(
              _headers[i],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
      if (i < _headers.length - 1) cells.add(SizedBox(width: 8));
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: cells),
    );
  }

  @override
  bool shouldRebuild(covariant _TableHeaderDelegate oldDelegate) => false;
}
