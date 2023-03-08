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
                productModel: ProductModel.fromJson(controller.products[index]),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.products.length),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColor.blue,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.black),
          ),
          child: Image.network(
            '${AppLink.productImage}/${productModel.image}',
            color: AppColor.white,
          ),
        ),
        Positioned(
          left: 10,
          child: Text(
            '${productModel.name}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        if (productModel.discount != '0')
          const Positioned(
              top: 10,
              child: Icon(
                Icons.discount_rounded,
                color: AppColor.black,
              ))
        // Container(
        //   color: Colors.black,
        // ),
      ],
    );
  }
}
