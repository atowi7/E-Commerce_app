import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/offers_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
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
    OffersController offersController = Get.find();
    FavoriteController favoriteController = Get.find();

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
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            favoriteController.isFav[controller.products[index]
                                    ['pro_id']] =
                                controller.products[index]['favorite'];
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
        controller.goToProductDetial(productModel);
      },
      child: Card(
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
                  '${productModel.name}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${controller.deliveryTime} Minute',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const Icon(
                        Icons.timer_sharp,
                        color: AppColor.primaryColor,
                      )
                    ],
                  ),
                ),
                Text(
                  '${productModel.priceafterdiscount}\$',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            if (productModel.discount != '0')
              const Positioned(
                  top: 20,
                  child: Icon(
                    Icons.discount_rounded,
                    color: AppColor.primaryColor,
                  ))
          ],
        ),
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
      onTap: () {},
      child: Card(
        child: Column(
          children: [
            Hero(
              tag: '${productModel.id}',
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
