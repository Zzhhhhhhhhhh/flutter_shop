import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  final List<String> _foodList = [
    "apple",
    "banana",
    "orange",
    "pear",
    "peach",
    "grape",
    "watermelon",
    "pineapple",
    "strawberry",
    "cherry",
    "mango",
    "plum",
    "pomegranate",
    "guava",
    "lychee",
    "kiwi",
    "coconut",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 4,
        children: List.generate(_foodList.length, (index) {
          return Child(
            foodName: _foodList[index],
            delIndex: index,
            onClose: (delIndex) {
              setState(() {
                _foodList.removeAt(delIndex);
                setState(() {});
              });
            },
          );
        }),
      ),
    );
  }
}

// class Child extends StatelessWidget {
//   final String? message;
//   const Child({super.key, this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Container(child: Text("无状态子组件${message}"));
//   }
// }

class Child extends StatefulWidget {
  final String foodName;
  final int delIndex;
  final Function(int index) onClose;
  const Child({
    super.key,
    required this.foodName,
    required this.delIndex,
    required this.onClose,
  });

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            widget.foodName,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        IconButton(
          onPressed: () {
            widget.onClose(widget.delIndex);
          },
          icon: Icon(Icons.close, color: Colors.white, size: 30),
        ),
      ],
    );
  }
}
