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
        return Container(
          child: controller.currentPage == -1
              ? const Home()
              : controller.pages.elementAt(controller.currentPage),
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
