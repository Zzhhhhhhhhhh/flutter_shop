import 'package:flutter/material.dart';

class SportsTestPage extends StatelessWidget {
  const SportsTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 16),
            // Tab 切换栏 - 在页面内容区域
            Container(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.grey[100],
                        child: TabBar(
                          tabs: const [
                            Tab(text: '立定跳远'),
                            Tab(text: '仰卧起坐'),
                            Tab(text: '坐位体前屈'),
                            Tab(text: '引体向上'),
                          ],
                          isScrollable: true,
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: const TextStyle(fontSize: 14),
                          indicatorColor: Colors.blue,
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.grey,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 3,
                          indicatorPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
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
            ),
            // Tab 内容区域
            Expanded(
              child: TabBarView(
                children: [
                  Container(child: Text("立定跳远")),
                  Container(child: Text("仰卧起坐")),
                  Container(child: Text("坐位体前屈")),
                  Container(child: Text("引起向上")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
