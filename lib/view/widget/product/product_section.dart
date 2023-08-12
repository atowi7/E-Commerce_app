import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find();

    return GetBuilder<ProductController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: GridView.builder(
            itemCount: controller.products.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              favoriteController.isFav[controller.products[index]['pro_id']] =
                  controller.products[index]['favorite'];
              return ProductWedget(
                productModel: ProductModel.fromJson(controller.products[index]),
              );
            }),
      );
    });
  }
}

class ProductWedget extends GetView<ProductController> {
  final ProductModel productModel;
  const ProductWedget({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToProductDetial(productModel),
      child: Container(
        padding: const EdgeInsets.all(2),
        child: Card(
          color: AppColor.secondaryColor,
          child: Stack(
            children: [
              Column(
                children: [
                  Hero(
                    tag: '${productModel.id}',
                    child: CachedNetworkImage(
                      imageUrl: '${AppLink.productImage}/${productModel.image}',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Text(
                    langTranslateDataBase(
                        productModel.nameAr!, productModel.name!),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '42'.tr,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Row(
                          children: List.generate(
                              5,
                              (index) => SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.star,
                                        color: AppColor.primaryColor,
                                      ),
                                      iconSize: 15,
                                    ),
                                  ))),
                    ],
                  ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(vertical: 8),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Text(
                  //         '${controller.deliveryTime} ${'43'.tr}',
                  //         style: Theme.of(context).textTheme.displaySmall,
                  //       ),
                  //       const Icon(Icons.timer_sharp)
                  //     ],
                  //   ),
                  // ),
                  Text(
                    '${productModel.priceafterdiscount} \$',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [

                  //     GetBuilder<FavoriteController>(builder: (controller) {
                  //       return IconButton(
                  //           onPressed: () {
                  //             if (controller.isFav[productModel.id] == '0') {
                  //               controller.setFavorite(productModel.id!, '1');
                  //               controller.addFavorite(productModel.id!);
                  //             } else {
                  //               controller.setFavorite(productModel.id!, '0');
                  //               controller.deleteFavorite(productModel.id!);
                  //             }
                  //           },
                  //           icon: controller.isFav[productModel.id] == '0'
                  //               ? const Icon(Icons.favorite_outline_rounded)
                  //               : const Icon(Icons.favorite));
                  //     }),
                  //   ],
                  // ),
                ],
              ),
              if (productModel.discount != '0')
                const Positioned(
                    // top: 20,
                    child: Icon(
                  Icons.discount_rounded,
                  color: AppColor.primaryColor,
                )),
            ],
          ),
        ),
      ),
    );
  }
}
