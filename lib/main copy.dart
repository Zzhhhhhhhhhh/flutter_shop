import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/starting.dart';
import 'pages/tabs.dart';
import 'pages/home.dart';
import 'pages/orders.dart';
import 'pages/test.dart';
import 'pages/profile.dart';
import 'pages/learning.dart';
import 'controllers/tabs_controller.dart'; // 导入控制器

void main() {
  Get.put(TabsController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 设置主色调 (Primary Color)
        primaryColor: Colors.blue, // AppBar、按钮等默认使用此颜色
        // 使用 Material Design 的色彩系统（推荐方式）
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, // 种子颜色，系统会自动生成调色板
          // 如果你想强制亮色/暗色主题，可以设置 brightness
          brightness: Brightness.light,
        ),

        // 设置 AppBar 主题
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // AppBar 背景色
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // 设置按钮主题
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 按钮背景色
            foregroundColor: Colors.white, // 按钮文字颜色
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      defaultTransition: Transition.cupertino,
      initialRoute: "/learning",
      getPages: [
        GetPage(name: "/", page: () => StartingPage()),
        GetPage(name: "/tabs", page: () => Tabs()),
        GetPage(name: "/test", page: () => TestPage()),
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/orders", page: () => OrdersPage()),
        GetPage(name: "/profile", page: () => ProFilePage()),
        GetPage(name: "/learning", page: () => LearningPage()),
      ],
    );
  }
}
