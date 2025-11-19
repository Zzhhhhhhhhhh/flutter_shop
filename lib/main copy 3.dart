import 'package:flutter/material.dart';
import 'pages/vue_webview_page.dart'; // 导入WebView页面

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Vue WebView',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const VueWebView(), // 直接显示WebView页面
    );
  }
}