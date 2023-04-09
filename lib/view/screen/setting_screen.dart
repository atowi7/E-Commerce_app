import 'package:ecommerce_app/controller/setting_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    return ListView(
      children: [
        CustomAppbar(
          searchHint: 'Find products',
          controller: TextEditingController(),
          onChanged: null,
          searchonPressed: () {},
          notifyPressed: () {},
          favPressed: () {
            Get.toNamed(AppRoute.userfavorite);
          },
        ),
        Container(
          padding: const EdgeInsets.all(50),
          decoration: const BoxDecoration(
            color: AppColor.blue,
          ),
          child: Lottie.asset(ImageAssets.profile),
        ),
        ListTile(
          onTap: () {
            FirebaseMessaging.instance.getToken().then((value) => print(value));
          },
          title: Text('Notification'),
          trailing: const Icon(Icons.notification_add_outlined),
        ),
        ListTile(
          onTap: () {
            Get.toNamed(AppRoute.addressview);
          },
          title: Text('Address'),
          trailing: const Icon(Icons.location_on_outlined),
        ),
        ListTile(
          onTap: () {
            Get.toNamed(AppRoute.ordersArchive);
          },
          title: Text('Archive'),
          trailing: const Icon(Icons.archive_outlined),
        ),
        ListTile(
          onTap: () {
            settingController.contactUs();
          },
          title: Text('Contact us'),
          trailing: const Icon(Icons.contact_mail_outlined),
        ),
        ListTile(
          onTap: () {
            settingController.logout();
          },
          title: Text('Logout'),
          trailing: const Icon(Icons.logout_outlined),
        )
      ],
    );
  }
}
