import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home.dart';
import './orders.dart';
import './profile.dart';
import '../controllers/tabs_controller.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late TabsController controller; // 获取控制器
  final List<Widget> _pages = [
    const OrdersPage(),
    const HomePage(),
    const ProFilePage(),
  ];

  @override
  void initState() {
    super.initState();
    controller = Get.find<TabsController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[controller.tabIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          type: BottomNavigationBarType.fixed, // ✅ 显式指定类型
          selectedItemColor: Color(0xff222222), // ✅ 选中项颜色
          unselectedItemColor: Color(0xffcccccc), // ✅ 未选中项颜色
          selectedLabelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
          // 点击事件
          onTap: (value) {
            controller.changeTab(value);
          },
          items: [
            BottomNavigationBarItem(icon: Container(), label: 'ORDERS'),
            BottomNavigationBarItem(icon: Container(), label: 'HOME'),
            BottomNavigationBarItem(icon: Container(), label: 'PROFILE'),
          ],
        ),
      ),
    );
  }
}
