import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class FixedTablePage extends StatefulWidget {
  const FixedTablePage({super.key});

  @override
  State<FixedTablePage> createState() => _FixedTablePageState();
}

class _FixedTablePageState extends State<FixedTablePage> {
  // 体测数据模型
  final List<ExerciseRecord> _records = [
    ExerciseRecord(
      projectName: '立定跳远',
      result: '2.1m',
      score: 75,
      level: '良好',
      classRank: '3/42',
      gradeRank: '56/360',
      classAvg: '2.0m',
      myBest: '2.19m',
      classBest: '2.28m',
      gradeBest: '2.3m',
      standard: '≥1.8m',
    ),
    ExerciseRecord(
      projectName: '引体向上',
      result: '8个',
      score: 60,
      level: '及格',
      classRank: '3/42',
      gradeRank: '56/360',
      classAvg: '7个',
      myBest: '10个',
      classBest: '11个',
      gradeBest: '13个',
      standard: '≥6个',
    ),
    ExerciseRecord(
      projectName: '坐位体前屈',
      result: '12.5cm',
      score: 95,
      level: '优秀',
      classRank: '3/42',
      gradeRank: '56/360',
      classAvg: '8.2cm',
      myBest: '13cm',
      classBest: '14.5cm',
      gradeBest: '16cm',
      standard: '≥6.0cm',
    ),
    ExerciseRecord(
      projectName: '50米跑',
      result: '7.8秒',
      score: 80,
      level: '良好',
      classRank: '3/42',
      gradeRank: '56/360',
      classAvg: '8.2秒',
      myBest: '7.3秒',
      classBest: '7.1秒',
      gradeBest: '6.8秒',
      standard: '≤8.0秒',
    ),
    ExerciseRecord(
      projectName: '100米跑',
      result: '14.6秒',
      score: 80,
      level: '良好',
      classRank: '3/42',
      gradeRank: '56/360',
      classAvg: '14.9秒',
      myBest: '14.5秒',
      classBest: '14秒',
      gradeBest: '13.8秒',
      standard: '≤16秒',
    ),
    ExerciseRecord(
      projectName: '一分钟跳绳',
      result: '150个',
      score: 85,
      level: '良好',
      classRank: '3/42',
      gradeRank: '56/360',
      classAvg: '140个',
      myBest: '175个',
      classBest: '200个',
      gradeBest: '210个',
      standard: '≥120个',
    ),
    ExerciseRecord(
      projectName: '一分钟仰卧起坐',
      result: '35个',
      score: 50,
      level: '待提高',
      classRank: '3/42',
      gradeRank: '56/360',
      classAvg: '40个',
      myBest: '40个',
      classBest: '53个',
      gradeBest: '55个',
      standard: '≥45个',
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学生体能测试成绩'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DataTable2(
          fixedTopRows: 1,
          // decoration: BoxDecoration(
          //   border: Border.all(color: const Color.fromARGB(255, 114, 39, 39)),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          columnSpacing: 0, // 列间距
          horizontalMargin: 10, // 水平边距
          minWidth: 800,
          // 列定义 - 居中对齐
          columns: [
            DataColumn2(label: _buildHeader('项目名称'), size: ColumnSize.M),
            DataColumn2(label: _buildHeader('成绩'), size: ColumnSize.S),
            DataColumn2(label: _buildHeader('得分'), size: ColumnSize.S),
            DataColumn2(label: _buildHeader('等级'), size: ColumnSize.S),
            DataColumn2(label: _buildHeader('班级排名'), size: ColumnSize.S),
            DataColumn2(label: _buildHeader('年级排名'), size: ColumnSize.S),
            DataColumn2(label: _buildHeader('班级平均分'), size: ColumnSize.S),
            DataColumn2(label: _buildHeader('我的最佳'), size: ColumnSize.S),
            DataColumn2(label: _buildHeader('班级最佳'), size: ColumnSize.S),
            DataColumn2(label: _buildHeader('年级最佳'), size: ColumnSize.S),
            DataColumn2(label: _buildHeader('国家标准（及格）'), size: ColumnSize.M),
          ],
          // 行数据 - 居中对齐
          rows: _records.map((record) {
            return DataRow2(
              cells: [
                DataCell(Center(child: Text(record.projectName))),
                DataCell(Center(child: Text(record.result))),
                DataCell(Center(child: Text(record.score.toString()))),
                DataCell(
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: getLevelColor(record.level),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        record.level,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                DataCell(Center(child: Text(record.classRank))),
                DataCell(Center(child: Text(record.gradeRank))),
                DataCell(Center(child: Text(record.classAvg))),
                DataCell(Center(child: Text(record.myBest))),
                DataCell(Center(child: Text(record.classBest))),
                DataCell(Center(child: Text(record.gradeBest))),
                DataCell(Center(child: Text(record.standard))),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

// 数据模型
class ExerciseRecord {
  final String projectName;
  final String result;
  final int score;
  final String level;
  final String classRank;
  final String gradeRank;
  final String classAvg;
  final String myBest;
  final String classBest;
  final String gradeBest;
  final String standard;

  ExerciseRecord({
    required this.projectName,
    required this.result,
    required this.score,
    required this.level,
    required this.classRank,
    required this.gradeRank,
    required this.classAvg,
    required this.myBest,
    required this.classBest,
    required this.gradeBest,
    required this.standard,
  });
}

Widget _buildHeader(String title) {
  return Container(
    height: 40,
    color: Colors.blue.shade800,
    alignment: Alignment.center,
    child: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 13,
      ),
    ),
  );
}

Color getLevelColor(String level) {
  switch (level) {
    case '优秀':
      return Colors.green;
    case '良好':
      return Colors.blue;
    case '及格':
      return Colors.yellow;
    case '待提高':
      return Colors.red;
    default:
      return Colors.grey;
  }
}
