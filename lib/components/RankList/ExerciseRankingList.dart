// 运动排行榜
import 'package:flutter/material.dart';

class ExerciseRankingList extends StatefulWidget {
  const ExerciseRankingList({super.key});

  @override
  State<ExerciseRankingList> createState() => _ExerciseRankingListState();
}

class _ExerciseRankingListState extends State<ExerciseRankingList> {
  int _selectedTabIndex = 0; // 当前选中的运动项目 Tab 索引
  int _selectedIndex = 0; // 默认选中“周榜”

  final List<String> tabNames = ['周榜', '月榜', '学期榜'];
  final List<String> sportTabs = ['跳绳', '立定跳远', '仰卧起坐', '坐位体前屈', '引体向上'];
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
  // 模拟数据：按运动项目和时间范围区分
  List<Map<String, String>> getRankingData(int sportIndex, int timeIndex) {
    // 这里可以根据 sportIndex 和 timeIndex 返回不同数据
    // 示例：简单返回固定数据，实际可从 API 或数据库获取
    return List.generate(
      50,
      (i) => {
        'rank': '${i + 1}',
        'name': '学生${i + 1}',
        'class': '班级${(i % 5) + 1}',
        'score': '${200 - i}次/分',
        'date': '2025-11-${10 + (i % 20)}',
      },
    );
  }

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
        _buildTitle(),
        SizedBox(height: 20),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 120),
            // color: Colors.amber,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // 运动项目 TabBar（手动控制）
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //左侧tabs
                      Row(
                        children: sportTabs.asMap().entries.map((entry) {
                          int index = entry.key;
                          String label = entry.value;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTabIndex = index;
                              });
                            },
                            child: Column(
                              children: [
                                // 文字部分
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: _selectedTabIndex == index
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: _selectedTabIndex == index
                                          ? Colors.blue
                                          : Colors.grey[600],
                                    ),
                                  ),
                                ),
                                // 底部横线（只在选中时显示）
                                Container(
                                  height: 2,
                                  width: 70, // 可根据文字长度调整
                                  color: _selectedTabIndex == index
                                      ? Colors.blue
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      // 右侧信息
                      Row(
                        children: [
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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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

                  // 时间范围筛选
                  Row(
                    children: tabNames.asMap().entries.map((entry) {
                      int index = entry.key;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
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
                            entry.value,
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

                  // 表头
                  _buildTableRow([
                    '排名',
                    '学生姓名',
                    '班级',
                    '锻炼成绩',
                    '日期',
                  ], isHeader: true),

                  // 数据列表（单个 ListView，根据状态刷新）
                  Expanded(
                    child: ListView.builder(
                      itemCount: getRankingData(
                        _selectedTabIndex,
                        _selectedIndex,
                      ).length,
                      itemBuilder: (context, index) {
                        final row = getRankingData(
                          _selectedTabIndex,
                          _selectedIndex,
                        )[index];
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
