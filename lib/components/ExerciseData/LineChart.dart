import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExerciseLineChart extends StatefulWidget {
  const ExerciseLineChart({super.key});

  @override
  State<ExerciseLineChart> createState() => _ExerciseLineChartState();
}

class _ExerciseLineChartState extends State<ExerciseLineChart> {
  int _selectedChartIndex = 0;
  final List<String> chartTypes = ['立定跳远', '仰卧起坐', '引体向上', '座位体前屈', '跳绳'];

  final List<Color> chartColors = [
    Color(0xFF6366F1),
    Color(0xFF10B981),
    Color(0xFFF59E0B),
    Color(0xFFEF4444),
    Color(0xFF8B5CF6),
  ];

  // 模拟数据 - 每个运动项目在三个日期的数据
  final Map<String, List<LineChartDataItem>> chartData = {
    '立定跳远': [
      LineChartDataItem(date: '08-23', value: 1.45, unit: 'm'),
      LineChartDataItem(date: '09-01', value: 1.68, unit: 'm'),
      LineChartDataItem(date: '09-26', value: 1.90, unit: 'm'),
      LineChartDataItem(date: '08-23', value: 2.85, unit: 'm'),
      LineChartDataItem(date: '09-01', value: 3.28, unit: 'm'),
    ],
    '仰卧起坐': [
      LineChartDataItem(date: '08-23', value: 45, unit: '次'),
      LineChartDataItem(date: '09-01', value: 48, unit: '次'),
      LineChartDataItem(date: '09-26', value: 52, unit: '次'),
    ],
    '引体向上': [
      LineChartDataItem(date: '08-23', value: 8, unit: '次'),
      LineChartDataItem(date: '09-01', value: 10, unit: '次'),
      LineChartDataItem(date: '09-26', value: 12, unit: '次'),
    ],
    '座位体前屈': [
      LineChartDataItem(date: '08-23', value: 15.5, unit: 'cm'),
      LineChartDataItem(date: '09-01', value: 16.2, unit: 'cm'),
      LineChartDataItem(date: '09-26', value: 16.8, unit: 'cm'),
    ],
    '跳绳': [
      LineChartDataItem(date: '08-23', value: 120, unit: '次/分'),
      LineChartDataItem(date: '09-01', value: 128, unit: '次/分'),
      LineChartDataItem(date: '09-26', value: 135, unit: '次/分'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final currentData = chartData[chartTypes[_selectedChartIndex]]!;
    final currentColor = chartColors[_selectedChartIndex];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 切换按钮
          _buildChartTypeSelector(),
          const SizedBox(height: 8),

          // 纵轴标签
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 4),

          // 图表
          SizedBox(
            height: 270,
            child: _buildLineChart(currentData, currentColor),
          ),
        ],
      ),
    );
  }

  // 图表类型选择器
  Widget _buildChartTypeSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(chartTypes.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(
                chartTypes[index],
                style: TextStyle(
                  fontSize: 12,
                  color: _selectedChartIndex == index
                      ? Colors.white
                      : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              selected: _selectedChartIndex == index,
              onSelected: (selected) {
                setState(() {
                  _selectedChartIndex = index;
                });
              },
              backgroundColor: Colors.grey[100],
              selectedColor: chartColors[index],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildLineChart(List<LineChartDataItem> data, Color color) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: _getInterval(data),
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.grey[100]!, strokeWidth: 1);
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1, // 关键：设置间隔为1，确保每个数据点都显示标签
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < data.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      data[index].date,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }
                return Text('');
              },
              reservedSize: 32,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey[200]!, width: 1),
        ),
        minX: 0,
        maxX: (data.length - 1).toDouble(),
        minY: _getMinY(data),
        maxY: _getMaxY(data),
        lineBarsData: [
          LineChartBarData(
            spots: data.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return FlSpot(index.toDouble(), item.value);
            }).toList(),
            isCurved: false,
            color: color,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: color,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color.withOpacity(0.3), color.withOpacity(0.05)],
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((touchedSpot) {
                final index = touchedSpot.spotIndex;
                return LineTooltipItem(
                  '${data[index].date}\n${touchedSpot.y.toStringAsFixed(1)}${data[index].unit}',
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }

  double _getMinY(List<LineChartDataItem> data) {
    double min = data.first.value;
    for (var item in data) {
      if (item.value < min) min = item.value;
    }
    return (min - (min * 0.1)).floorToDouble();
  }

  double _getMaxY(List<LineChartDataItem> data) {
    double max = data.first.value;
    for (var item in data) {
      if (item.value > max) max = item.value;
    }
    return (max + (max * 0.1)).ceilToDouble();
  }

  double? _getInterval(List<LineChartDataItem> data) {
    final maxY = _getMaxY(data);
    final minY = _getMinY(data);
    final range = maxY - minY;
    if (range <= 5) return 1;
    if (range <= 10) return 2;
    if (range <= 20) return 5;
    return 10;
  }
}

class LineChartDataItem {
  final String date;
  final double value;
  final String unit;

  LineChartDataItem({
    required this.date,
    required this.value,
    required this.unit,
  });
}
