// 柱状图
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExerciseChart extends StatelessWidget {
  const ExerciseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          const Text(
            '累计课后练习XXX次，超过年级XX%的学生',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          // 纵轴标签
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '锻炼次数',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
          ),
          // 图表
          SizedBox(
            height: 270,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                // 触摸
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${rod.toY.toInt()}次',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final titles = ['立定跳远', '仰卧起坐', '跳绳', '引体向上', '坐位体前屈'];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            titles[value.toInt()],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      reservedSize: 40,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value == meta.min || value == meta.max) {
                          return const SizedBox();
                        }
                        return Text(
                          '${value.toInt()}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        );
                      },
                      reservedSize: 28,
                      interval: 2,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: const FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 2,
                ),
                // 边框
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: Color.fromRGBO(204, 204, 204, 0.5),
                    width: 1,
                  ),
                ),
                barGroups: [
                  // 立定跳远 - 8次
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 8,
                        gradient: _getBarGradient(),
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                  // 仰卧起坐 - 6次
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 6,
                        gradient: _getBarGradient(),
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                  // 跳绳 - 10次
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 10,
                        gradient: _getBarGradient(),
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                  // 引体向上 - 3次
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 3,
                        gradient: _getBarGradient(),
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                  // 坐位体前屈 - 7次
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        toY: 7,
                        gradient: _getBarGradient(),
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ],
                maxY: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static LinearGradient _getBarGradient() {
    return LinearGradient(
      colors: [Colors.blue.shade400, Colors.blue.shade600],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }
}
