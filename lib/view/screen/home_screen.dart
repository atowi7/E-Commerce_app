import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/home/categorie_section.dart';
import 'package:ecommerce_app/view/widget/home/customappbar.dart';
import 'package:ecommerce_app/view/widget/home/customcard.dart';
import 'package:ecommerce_app/view/widget/home/customtitile.dart';
import 'package:ecommerce_app/view/widget/home/item_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              CustomeAppbar(
                searchHint: 'Finf products',
                searchonPressed: () {},
                notifyPressed: () {},
              ),
              const CustomCard(title: 'Summer Discount', disc: '20%'),
              const CategorieSection(),
              const Custometitle(title: 'Suggestios for products'),
              const ItemSection(),
            ],
          ),
        );
      }),
    );
  }
}
