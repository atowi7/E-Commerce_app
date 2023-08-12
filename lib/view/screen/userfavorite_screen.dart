import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/controller/userfavorite_controller.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/userfavorite/product_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFavoriteScreen extends StatelessWidget {
  const UserFavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    UserFavoriteController userFavoriteController =
        Get.put(UserFavoriteController());
    return RefreshIndicator(
      onRefresh: () async {
        await userFavoriteController.getData();
      },
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            CustomAppbar(
              context: context,
              searchHint: '41'.tr,
              controller: TextEditingController(),
              onChanged: null,
              searchonPressed: () {},
            ),
            const ProductSection(),
          ]),
        ),
      ),
    );
  }
}
