// 活跃排行榜
import 'package:flutter/material.dart';

class ActiveRankingList extends StatefulWidget {
  const ActiveRankingList({super.key});

  @override
  State<ActiveRankingList> createState() => _ActiveRankingListState();
}

class _ActiveRankingListState extends State<ActiveRankingList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/medal.png",
              width: 125,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 20),
              child: Text(
                "活跃排行榜",
                style: TextStyle(
                  fontSize: 96,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffF3B955),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Image.asset(
              "assets/images/medal.png",
              width: 125,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }
}
