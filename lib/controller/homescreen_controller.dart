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
  int currentPage = -1;
  List icons = [
    {
      'title': '134'.tr,
      'icon': Icons.discount_outlined,
    },
    {
      'title': '147'.tr,
      'icon': Icons.shopping_bag_outlined,
    },
    {
      'title': '136'.tr,
      'icon': Icons.settings_outlined,
    },
    {
      'title': '146'.tr,
      'icon': Icons.favorite_outline_rounded,
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
