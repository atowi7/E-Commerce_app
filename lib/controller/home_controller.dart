import 'package:ecommerce_app/core/service/services.dart';
import 'package:get/get.dart';

abstract class BaseHomeController extends GetxController {}

class HomeController extends BaseHomeController {
  AppServices appServices = Get.find();

  String? id;
  String? name;

  @override
  void onInit() {
    id = appServices.sharedPreferences.getString('userid');
    name = appServices.sharedPreferences.getString('username');
    super.onInit();
  }
}
