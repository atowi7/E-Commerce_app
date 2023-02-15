import 'package:ecommerce_app/controller/homescreen_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
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
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Scaffold(
        body: controller.pages.elementAt(controller.currentPage),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.white,
            onPressed: () {
              controller.changePage(0);
            },
            child: Icon(
              Icons.home_outlined,
              color:
                  controller.currentPage == 0 ? AppColor.blue : AppColor.black,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:const  CustomBottomAppBar(),
      );
    });
  }
}
