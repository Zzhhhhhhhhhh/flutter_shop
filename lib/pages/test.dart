import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcccccc),
      body: Center(child: ThreeDCard()),
    );
  }
}



class ThreeDCard extends StatefulWidget {
  @override
  _ThreeDCardState createState() => _ThreeDCardState();
}

class _ThreeDCardState extends State<ThreeDCard> {
  double _xRotation = 0.0;
  double _yRotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _xRotation += details.delta.dy * 0.01;
              _yRotation += details.delta.dx * 0.01;
            });
          },
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // 透视效果
              ..rotateX(_xRotation)
              ..rotateY(_yRotation),
            alignment: FractionalOffset.center,
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue[700]!, Colors.blue[500]!],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // 顶部高光
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  // 内容
                  Center(
                    child: Text(
                      '立定跳远',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
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