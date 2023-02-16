import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/home/categorie_section.dart';
import 'package:ecommerce_app/view/widget/home/customcard.dart';
import 'package:ecommerce_app/view/widget/home/customtitile.dart';
import 'package:ecommerce_app/view/widget/home/producthome_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView(
          children: [
            CustomAppbar(
              searchHint: 'Find products',
              searchonPressed: () {},
              notifyPressed: () {},
            ),
            const CustomCard(title: 'Summer Discount', disc: '20%'),
            const CategorieSection(),
            const Custometitle(title: 'Suggestios for products'),
            const ProductHomeSection(),
          ],
        ),
      );
    });
  }
}
