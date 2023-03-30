import 'package:ecommerce_app/view/screen/cart_screen.dart';
import 'package:ecommerce_app/view/screen/notification_screen.dart';
import 'package:ecommerce_app/view/screen/setting_screen.dart';
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
      'title': 'Profile',
      'icon': Icons.person_2_outlined,
    },
    {
      'title': 'Cart',
      'icon': Icons.shopping_basket_rounded,
    },
    {
      'title': 'Setting',
      'icon': Icons.settings_outlined,
    },
    {
      'title': 'Notify',
      'icon': Icons.notifications_active_rounded,
    }
  ];
  List<Widget> pages = [
    const Center(child: Text('p')),
    const CartScreen(),
    const SettingScreen(),
    const NotificationScreen(),
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
