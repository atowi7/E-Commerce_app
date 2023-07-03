import 'dart:io';

import 'package:ecommerce_app/controller/homescreen_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/widget/home/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());

    return Scaffold(
      body: GetBuilder<HomeScreenController>(builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            await Get.defaultDialog(
              title: '39'.tr,
              titleStyle: Theme.of(context).textTheme.displayMedium,
              middleText: '40'.tr,
              middleTextStyle: Theme.of(context).textTheme.displaySmall,
              onConfirm: () => exit(0),
              confirmTextColor: AppColor.blue,
              cancelTextColor: AppColor.blue,
              buttonColor: AppColor.white,
              onCancel: () {},
            );
            return false;
          },
          child: Container(
            child: controller.currentPage == -1
                ? const Home()
                : controller.pages.elementAt(controller.currentPage),
          ),
        );
      }),
      floatingActionButton:
          GetBuilder<HomeScreenController>(builder: (controller) {
        return FloatingActionButton(
            backgroundColor: AppColor.white,
            onPressed: () {
              controller.openHome();
            },
            child: Icon(
              Icons.home_outlined,
              color:
                  controller.currentPage == -1 ? AppColor.blue : AppColor.black,
            ));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
