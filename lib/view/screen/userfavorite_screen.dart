import 'package:ecommerce_app/controller/userfavorite_controller.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/userfavorite/product_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFavoriteScreen extends StatelessWidget {
  const UserFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        CustomAppbar(
          searchHint: 'Find products',
          searchonPressed: () {},
          notifyPressed: () {},
          favPressed: () {},
        ),
        const ProductSection(),
      ]),
    );
  }
}
