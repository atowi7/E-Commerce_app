import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/productdetail_controller.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailController controller = Get.put(ProductDetailController());
    return Scaffold(
      body: ListView(
        children: [
          CustomAppbar(
              searchHint: 'Find ...',
              searchonPressed: () {},
              notifyPressed: () {}),
          Container(
            height: 100,
            decoration: const BoxDecoration(
                color: AppColor.blue,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25))),
            child: CachedNetworkImage(
                imageUrl: '${AppLink.productImage}/${controller.productModel.image}'),
          )
        ],
      ),
    );
  }
}
