import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/userfavorite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/home/categorie_section.dart';
import 'package:ecommerce_app/view/widget/home/customcard.dart';
import 'package:ecommerce_app/view/widget/home/customtitile.dart';
import 'package:ecommerce_app/view/widget/home/producthome_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class userFavoriteScreen extends StatelessWidget {
  const userFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserFavoriteController);
    return Scaffold(
      body: ListView(
        children: [
          CustomAppbar(
            searchHint: 'Find products',
            searchonPressed: () {},
            notifyPressed: () {},
            favPressed: () {},
          ),
          GetBuilder<UserFavoriteController>(builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.datalist.length,
              itemBuilder: (context, index) =>
                  Text('${controller.datalist[index].proName}'),
            );
          })
        ],
      ),
    );
  }
}
