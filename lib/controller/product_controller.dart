import 'package:get/get.dart';

abstract class BaseProductController extends GetxController {
  initialData();
  getselcat(int i);
}

class ProductController extends BaseProductController {
  List categories = [];
  int? selcat;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selcat = Get.arguments['selcat'];
  }
  
  @override
  getselcat(int i) {
    selcat =i;
    update();
  }
}
