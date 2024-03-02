import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/offers_controller.dart';
import 'package:ecommerce_app/controller/orders/orders_controller.dart';
import 'package:ecommerce_app/controller/userfavorite_controller.dart';
import 'package:ecommerce_app/view/screen/offers_screen.dart';
import 'package:ecommerce_app/view/screen/orders/vieworders.dart';
import 'package:ecommerce_app/view/screen/setting_screen.dart';
import 'package:ecommerce_app/view/screen/userfavorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseHomeScreenController extends GetxController {
  changePage(int i);
  openHome();
}

class HomeScreenController extends BaseHomeScreenController {
  // final homeController = Get.lazyPut(() => HomeController());
  // final offersController = Get.lazyPut(() => OffersController());
  // final ordersController = Get.lazyPut(() => OrdersController());
  //final favoriteController = Get.lazyPut(() => FavoriteController());
  // final userFavoriteController = Get.lazyPut(() => UserFavoriteController());
  int currentPage = -1;
  List icons = [
    {
      'title': '134'.tr,
      'icon': Icons.discount_rounded,
    },
    {
      'title': '147'.tr,
      'icon': Icons.shopping_bag_rounded,
    },
    {
      'title': '136'.tr,
      'icon': Icons.settings_rounded,
    },
    {
      'title': '146'.tr,
      'icon': Icons.favorite_rounded,
    }
  ];
  List<Widget> pages = [
    const OffersScreen(),
    const ViewOrdersScreen(),
    const SettingScreen(),
    const UserFavoriteScreen(),
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  openHome() {
    currentPage = -1;
    update();
  }
}
