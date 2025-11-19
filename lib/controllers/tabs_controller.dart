import 'package:get/get.dart';

class TabsController extends GetxController {
  RxInt tabIndex = 1.obs; // 默认是 HOME (index=1)

  void changeTab(int index) {
    print(index);
    tabIndex.value = index;
  }
}
