import 'package:ecommerce_app/controller/productdetail_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ImageSection extends GetView<ProductDetailController> {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
      child: Hero(
        tag: '${controller.heroTag}_${controller.productModel.id}',
        child: CachedNetworkImage(
          imageUrl: '${AppLink.productImage}/${controller.productModel.image}',
          height: Get.height * 0.35,
          width: Get.width * 0.35,
        ),
      ),
    );
  }
}
