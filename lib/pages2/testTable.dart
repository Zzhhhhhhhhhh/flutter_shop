import 'package:flutter/material.dart';

class TestRecordScreen extends StatefulWidget {
  @override
  _TestRecordScreenState createState() => _TestRecordScreenState();
}

class _TestRecordScreenState extends State<TestRecordScreen> {
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

  // 模拟不同项目的数据（你可以替换成真实 API 数据）
  List<String> _generateDataFor(String item, int index) {
    switch (item) {
      case '座位体前屈':
        return [
          '游客$index',
          '男',
          '一年${(index % 5) + 1}班',
          '${6.9 + index * 0.5}cm',
          '2025-10-30 12:${(30 + index).toString().padLeft(2, '0')}:30',
          '${70 + index}',
          '锻炼报告',
        ];
      case '仰卧起坐':
        return [
          '学生$index',
          '女',
          '二年${(index % 4) + 1}班',
          '${30 + index}次',
          '2025-11-01 09:${(10 + index).toString().padLeft(2, '0')}:00',
          '${80 + index}',
          '查看详情',
        ];
      case '引体向上':
        return [
          '学员$index',
          '男',
          '三年${(index % 3) + 1}班',
          '${5 + index}个',
          '2025-11-02 14:${(20 + index).toString().padLeft(2, '0')}:15',
          '${85 + index}',
          '成绩分析',
        ];
      case '一分钟跳绳':
        return [
          '孩子$index',
          '女',
          '四年${(index % 2) + 1}班',
          '${120 + index * 2}次',
          '2025-11-03 16:${(40 + index).toString().padLeft(2, '0')}:45',
          '${90 + index}',
          '跳绳记录',
        ];
      case '立定跳远':
        return [
          '选手$index',
          '男',
          '五年${(index % 6) + 1}班',
          '${1.5 + index * 0.1}m',
          '2025-11-04 10:${(50 + index).toString().padLeft(2, '0')}:20',
          '${75 + index}',
          '动作评估',
        ];
      default:
        return List.filled(7, '--');
    }
  }

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

                  // 右侧内容区
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: _TableHeaderDelegate(),
                        ),
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
                              final data = _generateDataFor(
                                _selectedItem,
                                index,
                              );
                              return _buildDataRow(data);
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

  Widget _buildDataRow(List<String> data) {
    final List<double> widths = [120, 80, 120, 120, 160, 80, 140];
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

// 表头代理类（保持不变）
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
