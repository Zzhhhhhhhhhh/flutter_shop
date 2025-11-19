import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: CustomScrollView(
            slivers: [
              // SliverToBoxAdapter 包裹普通widget的容器哦
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Container(
                      height: 260,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.blue),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.asset(
                            "assets/images/shopping${index + 1}.jpg",
                            fit: BoxFit.cover,
                          );
                        },
                        onPageChanged: (value) {
                          setState(() {
                            _currentIndex = value;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return GestureDetector(
                              onTap: () {
                                // _pageController.jumpToPage(index);
                                _pageController.animateToPage(
                                  index,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              child: Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: _currentIndex == index
                                      ? Colors.amber
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPersistentHeader(
                delegate: SliverDelegate(),
                pinned: true, //固定吸顶
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverList.separated(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      "列表项${index + 1}",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "分类${index + 1}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 60;

  @override
  // TODO: implement minExtent
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    // throw UnimplementedError();
    return false;
  }
}
