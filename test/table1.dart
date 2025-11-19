import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserManagementPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({Key? key}) : super(key: key);

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // 模拟数据
  final List<Map<String, dynamic>> userData = [
    {'id': 1, 'name': '张三', 'email': 'zhangsan@example.com'},
    {'id': 2, 'name': '李四', 'email': 'lisi@example.com'},
    {'id': 3, 'name': '王五', 'email': 'wangwu@example.com'},
  ];

  final List<Map<String, dynamic>> configData = [
    {'key': 'theme', 'value': 'dark'},
    {'key': 'language', 'value': 'zh'},
    {'key': 'timezone', 'value': 'Asia/Shanghai'},
  ];

  final List<Map<String, dynamic>> roleData = [
    {'id': 1, 'name': '管理员', 'permissions': 'all'},
    {'id': 2, 'name': '普通用户', 'permissions': 'read'},
  ];

  final List<Map<String, dynamic>> taskData = [
    {'id': 1, 'task': '备份数据库', 'time': '02:00'},
    {'id': 2, 'task': '清理日志', 'time': '03:00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('管理系统'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: '用户管理'),
                Tab(text: '配置管理'),
                Tab(text: '角色管理'),
                Tab(text: '定时任务补偿'),
              ],
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 用户管理 - 表格
          DataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('姓名')),
              DataColumn(label: Text('邮箱')),
            ],
            rows: userData.map((data) => DataRow(
                  cells: [
                    DataCell(Text(data['id'].toString())),
                    DataCell(Text(data['name'])),
                    DataCell(Text(data['email'])),
                  ],
                )).toList(),
          ),

          // 配置管理 - 表格
          DataTable(
            columns: const [
              DataColumn(label: Text('键')),
              DataColumn(label: Text('值')),
            ],
            rows: configData.map((data) => DataRow(
                  cells: [
                    DataCell(Text(data['key'])),
                    DataCell(Text(data['value'])),
                  ],
                )).toList(),
          ),

          // 角色管理 - 表格
          DataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('角色名')),
              DataColumn(label: Text('权限')),
            ],
            rows: roleData.map((data) => DataRow(
                  cells: [
                    DataCell(Text(data['id'].toString())),
                    DataCell(Text(data['name'])),
                    DataCell(Text(data['permissions'])),
                  ],
                )).toList(),
          ),

          // 定时任务补偿 - 表格
          DataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('任务')),
              DataColumn(label: Text('执行时间')),
            ],
            rows: taskData.map((data) => DataRow(
                  cells: [
                    DataCell(Text(data['id'].toString())),
                    DataCell(Text(data['task'])),
                    DataCell(Text(data['time'])),
                  ],
                )).toList(),
          ),
        ],
      ),
    );
  }
}