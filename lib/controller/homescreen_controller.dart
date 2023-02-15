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
