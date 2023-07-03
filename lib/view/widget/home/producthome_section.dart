import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductHomeSection extends GetView<HomeController> {
  const ProductHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ProductWidget(
                productModel:
                    ProductModel.fromJson(controller.topSellingProducts[index]),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.topSellingProducts.length),
    );
  }
}

class ProductWidget extends GetView<HomeController> {
  final ProductModel productModel;
  const ProductWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return InkWell(
      onTap: () => controller.goToProductDetial(productModel),
      child: Card(
        child: Stack(
          children: [
            if (productModel.discount != '0')
              const Positioned(
                  top: 20,
                  child: Icon(
                    Icons.discount_rounded,
                    color: AppColor.black,
                  )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColor.black),
              ),
              child: Column(
                children: [
                  Hero(
                    tag: '${productModel.id}',
                    child: Image.network(
                      '${AppLink.productImage}/${productModel.image}',
                      color: AppColor.white,
                    ),
                  ),
                  Text(
                    '${productModel.name}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            // Container(
            //   color: Colors.black,
            // ),
          ],
        ),
      ),
    );
  }
}
