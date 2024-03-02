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
    FavoriteController favoriteController = Get.put(FavoriteController());

    return GetBuilder<ProductController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
              itemCount: controller.products.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                favoriteController.isFav[controller.products[index]['pro_id']] =
                    controller.products[index]['favorite'];
                return ProductWedget(
                  productModel:
                      ProductModel.fromJson(controller.products[index]),
                );
              }),
        ),
      );
    });
  }
}

class ProductWedget extends GetView<ProductController> {
  final ProductModel productModel;
  const ProductWedget({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    //  UserFavoriteController userFavoriteController = Get.find();
    return InkWell(
      onTap: () => controller.goToProductDetial(productModel, 'tag_p'),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColor.secondaryColor),
            ),
            child: Column(
              children: [
                Hero(
                  tag: 'tag_p_${productModel.id}',
                  child: CachedNetworkImage(
                    imageUrl: '${AppLink.productImage}/${productModel.image}',
                    height: 60,
                    width: 60,
                  ),
                ),

                Text(
                  langTranslateDataBase(
                      productModel.nameAr!, productModel.name!),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '42'.tr,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            5,
                            (index) => SizedBox(
                                  height: 20,
                                  width: 20,
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${productModel.priceafterdiscount} \$',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    GetBuilder<FavoriteController>(builder: (controller) {
                      return IconButton(
                          onPressed: () {
                            if (controller.isFav[productModel.id] == '0') {
                              controller.setFavorite(productModel.id!, '1');
                              controller.addFavorite(productModel.id!);
                            } else {
                              controller.setFavorite(productModel.id!, '0');
                              controller.deleteFavorite(productModel.id!);
                            }
                          },
                          icon: controller.isFav[productModel.id] == '0'
                              ? const Icon(Icons.favorite_outline_rounded)
                              : const Icon(Icons.favorite));
                    }),
                  ],
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
                )),
        ],
      ),
    );
  }
}
