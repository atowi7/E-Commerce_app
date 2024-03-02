import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductHomeSection extends GetView<HomeController> {
  final bool all;
  const ProductHomeSection(this.all, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: all
          ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductWidget(
                    productModel:
                        ProductModel.fromJson(controller.allProducts[index]),
                  ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: controller.allProducts.length)
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductWidget(
                    productModel: ProductModel.fromJson(
                        controller.topSellingProducts[index]),
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
    return InkWell(
      onTap: () => controller.goToProductDetial(productModel, 'tag_hp'),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColor.primaryColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Hero(
                //   tag: 'tag_hp_${productModel.id}',
                //   child: Image.network(
                //     '${AppLink.productImage}/${productModel.image}',
                //     height: 50,
                //     width: 50,
                //   ),
                // ),
                Image.network(
                    '${AppLink.productImage}/${productModel.image}',
                    height: 50,
                    width: 50,
                  ),
                Text(
                  langTranslateDataBase(
                      productModel.nameAr!, productModel.name!),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          if (productModel.discount != '0')
            const Positioned(
                top: 2,
                left: 4,
                child: Icon(
                  Icons.discount_rounded,
                  color: AppColor.primaryColor,
                  size: 25,
                )),
          // Container(
          //   color: Colors.black,
          // ),
        ],
      ),
    );
  }
}
