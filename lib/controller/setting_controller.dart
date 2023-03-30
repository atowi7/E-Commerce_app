import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseSettingController extends GetxController {
  logout();
}

class SettingController extends BaseSettingController {
  List sections = [
    {
      'title': 'About us',
      'icon': Icons.details_outlined,
      'onpress': () {},
    },
    {
      'title': 'Contact us',
      'icon': Icons.contact_page_rounded,
      'onpress': () {},
    },
    {
      'title': 'Address',
      'icon': Icons.location_on_outlined,
      'onpress': () {},
    },
    {
      'title': 'Display notifications',
      'icon': Icons.notifications_paused_outlined,
      'onpress': () {},
    },
    {
      'title': 'Logout',
      'icon': Icons.logout_outlined,
      'onpress': () {},
    }
  ];
  AppServices appServices = Get.find();
  @override
  logout() {
    String userid = appServices.sharedPreferences.getString('userid')!;

    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('user$userid');

    appServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
