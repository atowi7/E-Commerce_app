import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseHomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenController extends BaseHomeScreenController {
  int currentPage = 0;
  List icons = [
    {
      'title': 'Home',
      'icon': Icons.home_outlined,
    },
    {
      'title': 'Profile',
      'icon': Icons.person_2_outlined,
    },
    {
      'title': 'Setting',
      'icon': Icons.settings_outlined,
    },
    {
      'title': 'Favorite',
      'icon': Icons.favorite_border_outlined,
    }
  ];
  List<Widget> pages = [
    const Home(),
    const Center(child: Text('p')),
    const SettingScreen(),
    const Center(child: Text('f')),
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
