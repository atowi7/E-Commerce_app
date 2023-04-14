import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/offers_controller.dart';
import 'package:ecommerce_app/core/constant/route.dart';
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
    FavoriteController favoriteController = Get.put(FavoriteController());

    return ListView(
      children: [
        CustomAppbar(
          searchHint: 'Find products',
          controller: offersController.searchTextController!,
          onChanged: (val) {
            offersController.onChangeSearch(val);
          },
          searchonPressed: () {
            offersController.onSearch();
          },
          notifyPressed: () {},
          favPressed: () {
            Get.toNamed(AppRoute.userfavorite);
          },
        ),
        GetBuilder<OffersController>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.isSearch == false
                ? GridView.builder(
                    itemCount: controller.products.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      favoriteController
                              .isFav[controller.products[index]['pro_id']] =
                          controller.products[index]['favorite'];
                      return ProductWedget(
                        productModel:
                            ProductModel.fromJson(controller.products[index]),
                      );
                    })
                : Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
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
    );
  }
}

class ProductWedget extends GetView<OffersController> {
  final ProductModel productModel;
  const ProductWedget({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Stack(
          children: [
            Column(
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text('Rating'),
                //     Row(
                //         children: List.generate(
                //             3,
                //             (index) => IconButton(
                //                   onPressed: () {},
                //                   icon: const Icon(Icons.star),
                //                   iconSize: 10,
                //                 )))
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${controller.deliveryTime} Minute'),
                    const Icon(Icons.timer_sharp)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${productModel.priceafterdiscount}\$ Price'),
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
                    })
                  ],
                ),
              ],
            ),
            if (productModel.discount != '0')
              const Positioned(top: 20, child: Icon(Icons.discount_rounded))
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
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Rating'),
                Row(
                    children: List.generate(
                        3,
                        (index) => IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star),
                              iconSize: 10,
                            )))
              ],
            ),
            Text('${productModel.price}\$'),
          ],
        ),
      ),
    );
  }
}
