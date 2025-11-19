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
        child: Carousel3D(),
      ),
    );
  }
}

class Carousel3D extends StatefulWidget {
  @override
  _Carousel3DState createState() => _Carousel3DState();
}

class _Carousel3DState extends State<Carousel3D> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _cards = [
    {
      'title': '立定跳远',
      'color': Colors.blue[700]!,
      'icon': Icons.directions_run,
      'data': '2.35m'
    },
    {
      'title': '坐位体前屈',
      'color': Colors.green[700]!,
      'icon': Icons.self_improvement,
      'data': '18.5cm'
    },
    {
      'title': '仰卧起坐',
      'color': Colors.orange[700]!,
      'icon': Icons.fitness_center,
      'data': '45次/分钟'
    },
    {
      'title': '引体向上',
      'color': Colors.purple[700]!,
      'icon': Icons.accessible_forward,
      'data': '12次'
    },
    {
      'title': '50米跑',
      'color': Colors.red[700]!,
      'icon': Icons.directions_walk,
      'data': '7.2s'
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _cards.length;
        });
        _restartAutoScroll();
      }
    });
  }

  void _restartAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _cards.length;
        });
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
      width: 500,
      height: 320,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // 构建三个可见卡片：左、中、右
          _buildCard(_getCardIndex(-1), -1), // 左边卡片
          _buildCard(_getCardIndex(0), 0),   // 中间卡片（当前）
          _buildCard(_getCardIndex(1), 1),   // 右边卡片
        ],
      ),
    );
  }

  // 获取相对位置的卡片索引（处理循环）
  int _getCardIndex(int offset) {
    int index = _currentIndex + offset;
    if (index < 0) {
      return _cards.length + index; // 循环到末尾
    } else if (index >= _cards.length) {
      return index - _cards.length; // 循环到开头
    }
    return index;
  }

  Widget _buildCard(int index, int position) {
    bool isCurrent = position == 0;
    
    double horizontalOffset = 0.0;
    double scale = 1.0;
    double opacity = 1.0;

    // 根据位置计算变换参数
    switch (position) {
      case -1: // 左边
        horizontalOffset = -180;
        scale = 0.85;
        opacity = 0.7;
        break;
      case 0: // 中间（当前）
        horizontalOffset = 0;
        scale = 1.0;
        opacity = 1.0;
        break;
      case 1: // 右边
        horizontalOffset = 180;
        scale = 0.85;
        opacity = 0.7;
        break;
    }

    var card = _cards[index];

    return Positioned(
      left: 250 + horizontalOffset,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..scale(scale),
        alignment: Alignment.center,
        child: Opacity(
          opacity: opacity,
          child: GestureDetector(
            onTap: () {
              if (!isCurrent) {
                // 点击左边卡片向前移动，点击右边卡片向后移动
                int newIndex = _currentIndex + (position == -1 ? -1 : 1);
                if (newIndex < 0) newIndex = _cards.length - 1;
                if (newIndex >= _cards.length) newIndex = 0;
                _goToPage(newIndex);
              }
            },
            child: Container(
              width: 150,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    card['color'],
                    card['color'].withOpacity(0.8),
                    card['color'].withOpacity(0.6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: 2,
                  ),
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
                      card['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // 图标
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
                          card['icon'],
                          size: 50,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                  // 运动数据
                  Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Text(
                      card['data'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // 当前卡片指示点
                  if (isCurrent)
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}