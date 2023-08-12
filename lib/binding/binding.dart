import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/controller/offers_controller.dart';
import 'package:ecommerce_app/core/class/crud.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    // Get.lazyPut(() => HomeController());
    // Get.put(() => CartController());
    // Get.put(() => NotificationController());
    // Get.lazyPut(() => OffersController());
  }
}
