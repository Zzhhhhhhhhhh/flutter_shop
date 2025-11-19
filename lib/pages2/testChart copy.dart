import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExerciseData {
  final String exercise;
  final int week;
  final int count;
  final Color color;

  ExerciseData({
    required this.exercise,
    required this.week,
    required this.count,
    required this.color,
  });
}

class ExerciseSummary {
  final String exercise;
  final int totalCount;
  final Color color;
  final String rank;

  ExerciseSummary({
    required this.exercise,
    required this.totalCount,
    required this.color,
    required this.rank,
  });
}

class ExerciseChartPage extends StatefulWidget {
  @override
  _ExerciseChartPageState createState() => _ExerciseChartPageState();
}

class _ExerciseChartPageState extends State<ExerciseChartPage> {
  String selectedExercise = '立定跳远';
  List<ExerciseSummary> summaryData = [];
  List<ExerciseData> chartData = [];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    summaryData = [
      ExerciseSummary(
        exercise: '立定跳远',
        totalCount: 45,
        color: Colors.blue,
        rank: '超过年级85%的学生',
      ),
      ExerciseSummary(
        exercise: '仰卧起坐',
        totalCount: 38,
        color: Colors.green,
        rank: '超过年级72%的学生',
      ),
      ExerciseSummary(
        exercise: '引体向上',
        totalCount: 25,
        color: Colors.orange,
        rank: '超过年级65%的学生',
      ),
      ExerciseSummary(
        exercise: '座位体前屈',
        totalCount: 32,
        color: Colors.purple,
        rank: '超过年级78%的学生',
      ),
      ExerciseSummary(
        exercise: '跳绳',
        totalCount: 52,
        color: Colors.red,
        rank: '超过年级90%的学生',
      ),
    ];

    _updateChartData(selectedExercise);
  }

  void _updateChartData(String exercise) {
    Map<String, List<ExerciseData>> allData = {
      '立定跳远': [
        ExerciseData(exercise: '立定跳远', week: 1, count: 8, color: Colors.blue),
        ExerciseData(exercise: '立定跳远', week: 2, count: 12, color: Colors.blue),
        ExerciseData(exercise: '立定跳远', week: 3, count: 10, color: Colors.blue),
        ExerciseData(exercise: '立定跳远', week: 4, count: 15, color: Colors.blue),
      ],
      '仰卧起坐': [
        ExerciseData(exercise: '仰卧起坐', week: 1, count: 6, color: Colors.green),
        ExerciseData(exercise: '仰卧起坐', week: 2, count: 10, color: Colors.green),
        ExerciseData(exercise: '仰卧起坐', week: 3, count: 8, color: Colors.green),
        ExerciseData(exercise: '仰卧起坐', week: 4, count: 14, color: Colors.green),
      ],
      '引体向上': [
        ExerciseData(exercise: '引体向上', week: 1, count: 4, color: Colors.orange),
        ExerciseData(exercise: '引体向上', week: 2, count: 8, color: Colors.orange),
        ExerciseData(exercise: '引体向上', week: 3, count: 6, color: Colors.orange),
        ExerciseData(exercise: '引体向上', week: 4, count: 7, color: Colors.orange),
      ],
      '座位体前屈': [
        ExerciseData(
          exercise: '座位体前屈',
          week: 1,
          count: 7,
          color: Colors.purple,
        ),
        ExerciseData(
          exercise: '座位体前屈',
          week: 2,
          count: 9,
          color: Colors.purple,
        ),
        ExerciseData(
          exercise: '座位体前屈',
          week: 3,
          count: 11,
          color: Colors.purple,
        ),
        ExerciseData(
          exercise: '座位体前屈',
          week: 4,
          count: 5,
          color: Colors.purple,
        ),
      ],
      '跳绳': [
        ExerciseData(exercise: '跳绳', week: 1, count: 10, color: Colors.red),
        ExerciseData(exercise: '跳绳', week: 2, count: 15, color: Colors.red),
        ExerciseData(exercise: '跳绳', week: 3, count: 12, color: Colors.red),
        ExerciseData(exercise: '跳绳', week: 4, count: 15, color: Colors.red),
      ],
    };

    setState(() {
      selectedExercise = exercise;
      chartData = allData[exercise]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildExerciseTags(),
            SizedBox(height: 20),
            _buildSummaryCard(),
            SizedBox(height: 20),
            _buildLineChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '运动趋势',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '累计课后练习XXX，超过年级XX的学生',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildExerciseTags() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: summaryData.map((summary) {
        return GestureDetector(
          onTap: () => _updateChartData(summary.exercise),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: selectedExercise == summary.exercise
                  ? summary.color
                  : summary.color,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: summary.color,
                width: selectedExercise == summary.exercise ? 0 : 1,
              ),
            ),
            child: Text(
              summary.exercise,
              style: TextStyle(
                color: selectedExercise == summary.exercise
                    ? Colors.white
                    : summary.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSummaryCard() {
    final summary = summaryData.firstWhere(
      (data) => data.exercise == selectedExercise,
      orElse: () => summaryData.first,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '课后锻炼',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            '累计课后练习${summary.totalCount}次，${summary.rank}',
            style: TextStyle(fontSize: 14, color: Colors.blue[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    final summary = summaryData.firstWhere(
      (data) => data.exercise == selectedExercise,
      orElse: () => summaryData.first,
    );

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          children: [
            Text(
              '锻炼次数',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return Text('第${value.toInt()}周');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(value.toInt().toString());
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: chartData.map((data) {
                        return FlSpot(
                          data.week.toDouble(),
                          data.count.toDouble(),
                        );
                      }).toList(),
                      isCurved: true,
                      color: summary.color,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: summary.color.withOpacity(0.1),
                      ),
                    ),
                  ],
                  minY: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
