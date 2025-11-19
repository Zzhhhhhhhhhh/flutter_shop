import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class FxiedTablePage extends StatefulWidget {
  const FxiedTablePage({super.key});

  @override
  State<FxiedTablePage> createState() => _StudentExerciseTableState();
}

class _StudentExerciseTableState extends State<FxiedTablePage> {
  // 学生数据
  final List<Student> _students = [
    Student(1, '李子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(2, '王俊凯', '一年级4班', '210次/分', '2025-10-15'),
    Student(3, '张明轩', '一年级4班', '210次/分', '2025-10-15'),
    Student(4, '刘思雨', '一年级4班', '210次/分', '2025-10-15'),
    Student(5, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(6, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(7, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(1, '李子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(2, '王俊凯', '一年级4班', '210次/分', '2025-10-15'),
    Student(3, '张明轩', '一年级4班', '210次/分', '2025-10-15'),
    Student(4, '刘思雨', '一年级4班', '210次/分', '2025-10-15'),
    Student(5, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(6, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(7, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(1, '李子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(2, '王俊凯', '一年级4班', '210次/分', '2025-10-15'),
    Student(3, '张明轩', '一年级4班', '210次/分', '2025-10-15'),
    Student(4, '刘思雨', '一年级4班', '210次/分', '2025-10-15'),
    Student(5, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(6, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(7, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(1, '李子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(2, '王俊凯', '一年级4班', '210次/分', '2025-10-15'),
    Student(3, '张明轩', '一年级4班', '210次/分', '2025-10-15'),
    Student(4, '刘思雨', '一年级4班', '210次/分', '2025-10-15'),
    Student(5, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(6, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
    Student(7, '陈子涵', '一年级4班', '210次/分', '2025-10-15'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学生基础训练资料'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DataTable2(
          // 固定表头
          fixedTopRows: 1,
          // 表格装饰
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          // 列间距
          columnSpacing: 12,
          // 水平边距
          horizontalMargin: 12,
          // 最小宽度
          minWidth: 600,
          // 列定义 - 居中对齐
          columns: const [
            DataColumn2(
              label: Center(
                child: Text(
                  '排名',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              fixedWidth: 60.0, // 固定60像素宽度
            ),
            DataColumn2(
              label: Center(
                child: Text(
                  '学生姓名',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Center(
                child: Text(
                  '班级',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Center(
                child: Text(
                  '成绩',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Center(
                child: Text(
                  '日期',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              size: ColumnSize.M,
            ),
          ],
          // 行数据 - 居中对齐
          rows: _students
              .map(
                (student) => DataRow2(
                  cells: [
                    DataCell(Center(child: Text(student.ranking.toString()))),
                    DataCell(Center(child: Text(student.name))),
                    DataCell(Center(child: Text(student.className))),
                    DataCell(Center(child: Text(student.score))),
                    DataCell(Center(child: Text(student.date))),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// 学生数据模型
class Student {
  final int ranking;
  final String name;
  final String className;
  final String score;
  final String date;

  Student(this.ranking, this.name, this.className, this.score, this.date);
}
