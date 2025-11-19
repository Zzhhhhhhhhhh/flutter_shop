import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Container(
        //   width: 500,
        //   child: ListView(
        //     children: List.generate(100, (index) {
        //       return Container(
        //         height: 80,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(color: Colors.red),
        //         margin: EdgeInsets.only(bottom: 10),
        //         child: Text(
        //           "${index + 1}个",
        //           style: TextStyle(color: Colors.white, fontSize: 30),
        //         ),
        //       );
        //     }),
        //   ),
        // ),
        // child: Container(
        //   width: 500,
        //   child: ListView.builder(
        //     itemCount: 100,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         height: 80,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(color: Colors.red),
        //         margin: EdgeInsets.only(bottom: 10),
        //         child: Text(
        //           "${index + 1}个",
        //           style: TextStyle(color: Colors.white, fontSize: 30),
        //         ),
        //       );
        //     },
        //   ),
        // ),
        child: Container(
          width: 500,
          child: ListView.separated(
            itemCount: 30,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.red),
                child: Text(
                  "${index + 1}个",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Container(height: 10, color: Colors.grey);
            },
          ),
        ),
      ),
    );
  }
}
