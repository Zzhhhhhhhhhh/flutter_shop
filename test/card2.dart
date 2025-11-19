import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3D Card Carousel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100]!,
      body: Center(
        child: SpacedCardCarousel(),
      ),
    );
  }
}

class SpacedCardCarousel extends StatefulWidget {
  @override
  _SpacedCardCarouselState createState() => _SpacedCardCarouselState();
}

class _SpacedCardCarouselState extends State<SpacedCardCarousel> {
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        int nextIndex = (_currentIndex + 1) % 3;
        _goToPage(nextIndex);
        _restartAutoScroll();
      }
    });
  }

  void _restartAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        int nextIndex = (_currentIndex + 1) % 3;
        _goToPage(nextIndex);
        _restartAutoScroll();
      }
    });
  }

  void _goToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 左侧卡片 - 增加间距
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(-0.15)
              ..scale(0.9),
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(right: 20), // 右侧间距
              child: _buildCard((_currentIndex - 1) % 3, false),
            ),
          ),
          
          // 中间卡片
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001),
            alignment: Alignment.center,
            child: _buildCard(_currentIndex, true),
          ),
          
          // 右侧卡片 - 增加间距
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(0.15)
              ..scale(0.9),
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(left: 20), // 左侧间距
              child: _buildCard((_currentIndex + 1) % 3, false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(int index, bool isFront) {
    Color color = Colors.blue[500]!;
    double width = isFront ? 280 : 240;
    double height = isFront ? 220 : 200;
    double borderRadius = 16.0;

    String title = ['立定跳远', '坐位体前屈', '仰卧起坐'][index];
    IconData icon = Icons.accessibility_new;

    return GestureDetector(
      onTap: () {
        if (!isFront) {
          _goToPage(index);
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.9),
              color.withOpacity(0.7),
              color.withOpacity(0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            // 下方阴影：悬浮感
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
              spreadRadius: 2,
            ),
            // 上方高光：玻璃感
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Stack(
          children: [
            // 顶部高光条（模拟指示灯）
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            // 标题
            Positioned(
              top: 30,
              left: 16,
              right: 16,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 图标（小人）
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Icon(
                  icon,
                  size: 60,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}