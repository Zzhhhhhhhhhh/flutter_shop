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
      backgroundColor: Colors.grey[100]!,
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
      height: 320, // 增加高度以适应更高的卡片
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 左侧卡片
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(-0.15)
              ..scale(0.9),
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(right: 20),
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
          
          // 右侧卡片
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(0.15)
              ..scale(0.9),
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: _buildCard((_currentIndex + 1) % 3, false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(int index, bool isFront) {
    // 为每个卡片设置不同的颜色
    List<Color> cardColors = [
      Colors.blue[700]!,      // 立定跳远 - 蓝色
      Colors.green[700]!,     // 坐位体前屈 - 绿色
      Colors.orange[700]!,    // 仰卧起坐 - 橙色
    ];
    
    Color color = cardColors[index];
    double width = 150; // 固定宽度150
    double height = 300; // 固定高度300
    double borderRadius = 16.0;

    String title = ['立定跳远', '坐位体前屈', '仰卧起坐'][index];
    // 为每个卡片设置不同的图标
    List<IconData> icons = [
      Icons.directions_run,      // 立定跳远
      Icons.self_improvement,    // 坐位体前屈
      Icons.fitness_center,      // 仰卧起坐
    ];
    IconData icon = icons[index];

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
              color,
              color.withOpacity(0.8),
              color.withOpacity(0.6),
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
            // 顶部高光条
            Positioned(
              top: 15,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 40,
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
              top: 40,
              left: 8,
              right: 8,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 图标（根据运动类型）
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Icon(
                    icon,
                    size: 50,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
            ),
            // 底部装饰元素
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // 运动数据模拟
                  Text(
                    _getSportData(index),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 当前卡片指示点
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFront ? Colors.white : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 为每个运动类型提供不同的数据
  String _getSportData(int index) {
    switch (index) {
      case 0: // 立定跳远
        return '2.35m';
      case 1: // 坐位体前屈
        return '18.5cm';
      case 2: // 仰卧起坐
        return '45次/分钟';
      default:
        return '';
    }
  }
}