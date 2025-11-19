import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/title.png", width: 120),
      ),
      body: Center(
        child: Container(
          width: 375,
          padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              // 筛选项
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(34, 34, 34, 0.41),
                        width: 1.0, // 1px 边框
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      "MAN",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff365099),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(34, 34, 34, 0.41),
                        width: 1.0, // 1px 边框
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      "SHOES",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff365099),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(34, 34, 34, 0.41),
                        width: 1.0, // 1px 边框
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      "\$100-200",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff365099),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // 标题
              Text(
                "Man Shoes",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff222222),
                ),
              ),
              // 按钮
              SizedBox(height: 24),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff302f4d),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      child: Text(
                        "Free Shipping",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
              // 卡片
              SizedBox(height: 10),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff222222),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.4), // 阴影颜色和透明度
                      offset: Offset(0, 8), // x,y轴偏移量
                      blurRadius: 26.0, // 阴影模糊半径
                      spreadRadius: 0.0, // 扩散半径
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    //左
                    Stack(
                      children: [
                        // 第一张图片
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/orders1.png',
                            fit: BoxFit.cover,
                            width: 150,
                          ),
                        ),
                        // 第二张图片，旋转处理
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateZ(30 * 3.1415926 / 180) // 旋转角度
                            ..translate(0.0, 20.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/orders1.png',
                              fit: BoxFit.cover,
                              width: 150,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //右
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Nike Air Max 270",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Nike",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffAFAFBD),
                            ),
                          ),
                          Text(
                            "\$195.80",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    //左
                    Stack(
                      children: [
                        // 第一张图片
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/orders2.png',
                            fit: BoxFit.cover,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                    //右
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Nike Air Max 90",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff222222),
                            ),
                          ),
                          Text(
                            "Nike",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffAFAFBD),
                            ),
                          ),
                          Text(
                            "\$195.80",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff222222),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    //左
                    Stack(
                      children: [
                        // 第一张图片
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/orders3.png',
                            fit: BoxFit.cover,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                    //右
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Nike Air Max 90",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff222222),
                            ),
                          ),
                          Text(
                            "Nike",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffAFAFBD),
                            ),
                          ),
                          Text(
                            "\$195.80",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff222222),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // 按钮
              SizedBox(height: 10),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff302f4d),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      child: Text(
                        "Reviews (180)",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
