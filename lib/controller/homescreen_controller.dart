import 'package:ecommerce_app/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseHomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenController extends BaseHomeScreenController {
  int currentPage = 0;
  List pagetitle = [
    'Home',
    'Profile',
    'Setting',
    'Favorite',
  ];
  List pageicon= [
    Icons.home_outlined,
    Icons.person_2_outlined,
    Icons.settings_outlined,
    Icons.favorite_border_outlined,
  ];
  List<Widget> pages = [
    const Home(),
    const Center(child: Text('p')),
    const Center(child: Text('s')),
    const Center(child: Text('f')),
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
