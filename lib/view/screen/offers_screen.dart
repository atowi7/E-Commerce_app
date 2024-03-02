import 'package:ecommerce_app/controller/offers_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController offersController = Get.put(OffersController());
    // FavoriteController favoriteController = Get.find();

    return RefreshIndicator(
      onRefresh: () async {
        await offersController.getData();
      },
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CustomAppbar(
                context: context,
                searchHint: '41'.tr,
                controller: offersController.searchTextController!,
                onChanged: (val) {
                  offersController.onChangeSearch(val);
                },
                searchonPressed: () {
                  offersController.onSearch();
                },
              ),
              GetBuilder<OffersController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch == false
                      ? GridView.builder(
                          itemCount: controller.products.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                          ),
                          itemBuilder: (context, index) {
                            // favoriteController.isFav[controller.products[index]
                            //         ['pro_id']] =
                            //     controller.products[index]['favorite'];
                            return ProductWedget(
                              productModel: ProductModel.fromJson(
                                  controller.products[index]),
                            );
                          })
                      : Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 40),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.searchProducts.length,
                              itemBuilder: (context, i) {
                                return ProductSearchWedget(
                                    productModel: controller.searchProducts[i]);
                              }),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductWedget extends GetView<OffersController> {
  final ProductModel productModel;
  const ProductWedget({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetial(productModel, 'tag_op');
      },
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'tag_op_${productModel.id}',
                  child: CachedNetworkImage(
                    imageUrl: '${AppLink.productImage}/${productModel.image}',
                    height: 70,
                    width: 70,
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
                //         '${controller.deliveryTime} Minute',
                //         style: Theme.of(context).textTheme.displaySmall,
                //       ),
                //       const Icon(
                //         Icons.timer_sharp,
                //         color: AppColor.primaryColor,
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: Get.size.height * 0.02,
                ),
                Text(
                  '${productModel.priceafterdiscount}\$',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          if (productModel.discount != '0')
            const Positioned(
                top: 8,
                child: Icon(
                  Icons.discount_rounded,
                  color: AppColor.primaryColor,
                ))
        ],
      ),
    );
  }
}

class ProductSearchWedget extends GetView<OffersController> {
  final ProductModel productModel;
  const ProductSearchWedget({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetial(productModel, 'tag_ops');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.primaryColor),
        ),
        child: Column(
          children: [
            Hero(
              tag: 'tag_ops_${productModel.id}',
              child: CachedNetworkImage(
                imageUrl: '${AppLink.productImage}/${productModel.image}',
                height: 70,
                width: 70,
              ),
            ),
            Text(
              '${productModel.name}',
              style: Theme.of(context).textTheme.displayMedium,
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
            Text('${productModel.price}\$'),
          ],
        ),
      ),
    );
  }
}
