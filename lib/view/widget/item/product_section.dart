import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/categorie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSection extends GetView<ProductController> {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ProductWidget(
                categorieModel:
                    CategorieModel.fromJson(controller.categories[index]),
                i: index,
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.categories.length),
    );
  }
}

class ProductWidget extends GetView<ProductController> {
  final CategorieModel categorieModel;
  final int i;
  const ProductWidget(
      {super.key, required this.categorieModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.getselcat(i),
      child: Column(
        children: [
          GetBuilder<ProductController>(builder: (controller) {
            return Container(
              decoration: controller.selcat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 5, color: AppColor.black)))
                  : null,
              child: Text(
                '${categorieModel.name}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          }),
        ],
      ),
    );
  }
}
