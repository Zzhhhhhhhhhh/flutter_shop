import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpLearning extends StatefulWidget {
  const HttpLearning({super.key});

  @override
  State<HttpLearning> createState() => _HttpLearningState();
}

class _HttpLearningState extends State<HttpLearning> {
  var list = [];
  @override
  void initState() {
    super.initState();
    Dio()
        .get("https://geek.itheima.net/v1_0/channels")
        .then((res) => {
            print(res.data)
          }
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
