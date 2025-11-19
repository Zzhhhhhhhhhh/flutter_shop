// 运动排行榜
import 'package:flutter/material.dart';

class ExerciseRankingList extends StatefulWidget {
  const ExerciseRankingList({super.key});

  @override
  State<ExerciseRankingList> createState() => _ExerciseRankingListState();
}

class _ExerciseRankingListState extends State<ExerciseRankingList> {
  int _selectedIndex = 0; // 默认选中“周榜”
  final List<String> tabNames = ['周榜', '月榜', '学期榜'];
  // 模拟数据
  final List<Map<String, String>> data = List.generate(
    50,
    (i) => {
      'rank': '${i + 1}',
      'name': '学生${i + 1}',
      'class': '班级${(i % 5) + 1}',
      'score': '${200 - i}次/分',
      'date': '2025-11-${10 + (i % 20)}',
    },
  ).toList();

  // 定义每列宽度（单位：逻辑像素）
  static const double rankWidth = 160;
  static const double nameWidth = 200;
  static const double classWidth = 180;
  static const double scoreWidth = 200;
  static const double dateWidth = 200;
  Widget _buildTableRow(List<String> cells, {bool isHeader = false}) {
    final textStyle = TextStyle(
      fontSize: 14,
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      color: isHeader ? Colors.black : Colors.grey[800],
    );

    final backgroundColor = isHeader
        ? Colors.grey[200]
        : (cells[0].hashCode % 2 == 0 ? Colors.grey[50] : Colors.white);

    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _cell(cells[0], width: rankWidth, textStyle: textStyle),
          _cell(cells[1], width: nameWidth, textStyle: textStyle),
          _cell(cells[2], width: classWidth, textStyle: textStyle),
          _cell(cells[3], width: scoreWidth, textStyle: textStyle),
          _cell(cells[4], width: dateWidth, textStyle: textStyle),
        ],
      ),
    );
  }

  Widget _cell(
    String text, {
    required double width,
    required TextStyle textStyle,
  }) {
    return SizedBox(
      width: width,
      child: Center(
        // ← 关键：文字水平居中
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center, // 防止长文本换行时不对齐
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/medal.png", width: 125, fit: BoxFit.cover),
        Container(
          margin: EdgeInsets.only(left: 10, right: 20),
          child: Text(
            "运动排行榜",
            style: TextStyle(
              fontSize: 96,
              fontWeight: FontWeight.w600,
              color: Color(0xffF3B955),
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Image.asset("assets/images/medal.png", width: 125, fit: BoxFit.cover),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 标题
        _buildTitle(),
        // 空行
        SizedBox(height: 20),
        // 内容
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 120),
            color: Colors.amber,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: DefaultTabController(
                length: 5,
                child: Scaffold(
                  body: Column(
                    children: [
                      const SizedBox(height: 16),
                      // Tabs
                      Column(
                        children: [
                          // 顶部
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // 左侧tab
                              Row(
                                children: [
                                  TabBar(
                                    isScrollable: true,
                                    labelStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    unselectedLabelStyle: const TextStyle(
                                      fontSize: 14,
                                    ),
                                    indicatorColor: Colors.blue,
                                    labelColor: Colors.blue,
                                    unselectedLabelColor: Colors.grey,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicatorWeight: 3,
                                    indicatorPadding:
                                        const EdgeInsets.symmetric(
                                          horizontal: 16,
                                        ),
                                    tabs: const [
                                      Tab(text: '跳绳'),
                                      Tab(text: '立定跳远'),
                                      Tab(text: '仰卧起坐'),
                                      Tab(text: '坐位体前屈'),
                                      Tab(text: '引体向上'),
                                    ],
                                  ),
                                ],
                              ),
                              // 右侧
                              Row(
                                children: [
                                  // 更新时间
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '最新更新时间: 2025-10-20 13:40:00',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                  // 年级信息
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      '一年级',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          // 榜单筛选
                          Row(
                            children: tabNames.map((name) {
                              int index = tabNames.indexOf(name);
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _selectedIndex == index
                                        ? Colors.blue
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      color: _selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: _selectedIndex == index
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      // 固定表头
                      _buildTableRow([
                        '排名',
                        '学生姓名',
                        '班级',
                        '锻炼成绩',
                        '日期',
                      ], isHeader: true),
                      // Tab 列表区域
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              color: Colors.red,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final row = data[index];
                                  return _buildTableRow([
                                    row['rank']!,
                                    row['name']!,
                                    row['class']!,
                                    row['score']!,
                                    row['date']!,
                                  ]);
                                },
                              ),
                            ),
                            Container(color: Colors.red, child: Text("立定跳远")),
                            Container(color: Colors.red, child: Text("仰卧起坐")),
                            Container(color: Colors.red, child: Text("坐位体前屈")),
                            Container(color: Colors.red, child: Text("引起向上")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
