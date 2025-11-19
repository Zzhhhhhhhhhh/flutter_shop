import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tabs_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'SHOES'; // 默认选中 SHOES
  String selectedPrice = '￥100-200'; // 默认选中 SHOES
  String selectedShipping = 'FREE SHIPPING'; // 默认选中 SHOES

  final List<String> categoriesList = [
    'MAN',
    'WOMAN',
    'KIDS',
    'SHOES',
    'PANTS',
    'T-SHIRTS',
    'SOCKS',
    'BACKPACK',
    'WALLET',
    'T-SHIRTS',
    'SUIT',
    'SKIRT',
  ];
  final List<String> pricesList = ['￥100-200', '￥200-450', '￥450+'];
  final List<String> shippingList = ['FREE SHIPPING', 'FRST SHIPPING'];

  void _onCategoryTap(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _onPriceTap(String category) {
    setState(() {
      selectedPrice = category;
    });
  }

  void _onShippingTap(String category) {
    setState(() {
      selectedShipping = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          child: Column(
            children: [
              SizedBox(height: 70),
              Image.asset(
                "assets/images/logoBlack.png",
                width: 200,
                height: 30,
              ),
              Text(
                "always care customers",
                style: TextStyle(
                  color: Color(0xff222222),
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 55),
              Text(
                "You can pick anything want you want.",
                style: TextStyle(
                  color: Color(0xff222222),
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  children: [
                    // Categories
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff222222),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: categoriesList.map((category) {
                        bool isSelected = selectedCategory == category;
                        return GestureDetector(
                          onTap: () => _onCategoryTap(category),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.black
                                    : Color(0xff365099),
                                width: isSelected ? 2.0 : 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: Color(0xff365099),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    // Prices
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Text(
                          "Prices",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff222222),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: pricesList.map((category) {
                        bool isSelected = selectedPrice == category;
                        return GestureDetector(
                          onTap: () => _onPriceTap(category),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.black
                                    : Color(0xff365099),
                                width: isSelected ? 2.0 : 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: Color(0xff365099),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    //Shipping
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Text(
                          "Prices",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff222222),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: shippingList.map((category) {
                        bool isSelected = selectedShipping == category;
                        return GestureDetector(
                          onTap: () => _onShippingTap(category),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.black
                                    : Color(0xff365099),
                                width: isSelected ? 2.0 : 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: Color(0xff365099),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    // 按钮
                    SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff222222),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () {
                        //electedCategory
                        //selectedPrice
                        //selectedShipping
                        Get.find<TabsController>().changeTab(0);
                      },
                      child: Text(
                        "Search",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
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

// 自定义按钮
// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text;
  void Function()? onPressed;
  Button(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xff365099),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(
            color: Color(0xff365099), // 你想要的边框颜色
            width: 1.0, // 边框宽度
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
