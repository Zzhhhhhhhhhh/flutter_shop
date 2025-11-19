import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/starting.dart';
import 'pages/tabs.dart';
import 'pages/home.dart';
import 'pages/orders.dart';
import 'pages/test.dart';
import 'pages/profile.dart';
import 'pages/learning.dart';
import 'pages/fxiedTable.dart';
import 'controllers/tabs_controller.dart'; // 导入控制器
//  新增路由
import 'pages2/LoginPage.dart';
import 'pages2/FaceLoginPage.dart';
import 'pages2/ExercoseRankListPage.dart';
import 'pages2/ExerciseDataPage.dart';
import 'pages2/ExerciseLog.dart';
import 'pages2/ExerciseDetailPage.dart';
import 'pages2/testTable.dart';
import 'pages2/dataTable2.dart';
import 'pages2/testChart.dart';
import 'pages2/testTabs.dart';
import 'package:flutter/services.dart';

// 学习
import 'pages2/http.dart';

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
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

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
      initialRoute: "/exerciseRankList",
      getPages: [
        GetPage(name: "/", page: () => StartingPage()),
        GetPage(name: "/tabs", page: () => Tabs()),
        GetPage(name: "/test", page: () => TestPage()),
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/orders", page: () => OrdersPage()),
        GetPage(name: "/profile", page: () => ProFilePage()),
        GetPage(name: "/learning", page: () => LearningPage()),
        GetPage(name: "/fxiedTable", page: () => FxiedTablePage()),
        GetPage(
          name: "/exerciseRankList",
          page: () => ExercoseRankListPage(),
        ), // 活跃排行榜
        GetPage(name: "/exerciseData", page: () => ExerciseDataPage()), // 运动数据
        GetPage(name: "/exerciseLog", page: () => ExerciseLogPage()), // 测试记录
        GetPage(
          name: "/exerciseDetail",
          page: () => ExerciseDetailPage(),
        ), // 锻炼报告
        GetPage(name: "/login", page: () => LoginPage()), // 登录
        GetPage(name: "/faceLogin", page: () => FaceLoginPage()), // 人脸登录
        GetPage(name: "/testTable", page: () => TestRecordScreen()),
        GetPage(name: "/dataTable2", page: () => FixedTablePage()),
        GetPage(name: "/chart", page: () => ExerciseChartPage()),
        GetPage(name: "/testTabs", page: () => SportsTestPage()),
        GetPage(name: "/httpTest", page: () => HttpLearning()),
      ],
    );
  }
}
