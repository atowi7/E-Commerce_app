import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/product/categories_section.dart';
import 'package:ecommerce_app/view/widget/product/product_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    return Scaffold(
      body: ListView(
        children: [
          CustomAppbar(
            context: context,
            searchHint: '41'.tr,
            controller: TextEditingController(),
            onChanged: null,
            searchonPressed: () {},
          ),
          const CategoriesSection(),
          const ProductSection(),
        ],
      ),
    );
  }
}
