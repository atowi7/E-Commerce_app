import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/productdetail_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/productdetail/Image_section.dart';
import 'package:ecommerce_app/view/widget/productdetail/amountandprice_section.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailController pcontroller = Get.put(ProductDetailController());
    // FavoriteController favoriteController = Get.find();

    // favoriteController.clear();

    // print('details productModel.favorite ${fcontroller.isFav}');

    return Scaffold(
      body: GetBuilder<ProductDetailController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const ImageSection(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${langTranslateDataBase(controller.productModel.nameAr!, controller.productModel.name!)}',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                AmountAndPriceSection(
                  price: controller.productModel.priceafterdiscount!,
                  onPressedAdd: () {
                    controller.addCount();
                  },
                  count: controller.count,
                  onPressedDelete: () {
                    controller.deleteCount();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${langTranslateDataBase(controller.productModel.descriptionAr!, controller.productModel.description!)}',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '44'.tr,
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${langTranslateDataBase(controller.productModel.colorAr!, controller.productModel.color!)}',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                if (controller.productModel.rate == '-1')
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: AppColor.blue,
                        borderRadius: BorderRadius.circular(25)),
                    child: MaterialButton(
                        onPressed: () {
                          final dailog = RatingDialog(
                              initialRating: 1.0,
                              title: Text(
                                '81'.tr,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              message: Text(
                                '82'.tr,
                                textAlign: TextAlign.center,
                              ),
                              submitButtonText: '83'.tr,
                              submitButtonTextStyle:
                                  const TextStyle(color: AppColor.blue),
                              onSubmitted: (value) {
                                if (value.rating == 0.0) {
                                  Get.snackbar('84'.tr, '85'.tr);
                                } else {
                                  controller.sendRatring(
                                      controller.productModel.id!,
                                      value.rating,
                                      value.comment);
                                }
                              });
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => dailog);
                        },
                        child: Text(
                          '86'.tr,
                          style: Theme.of(context).textTheme.displayMedium,
                        )),
                  ),
              ],
            )
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: List.generate(
            //       controller.itemf.length,
            //       (index) => Container(
            //         padding: const EdgeInsets.all(10),
            //         decoration: BoxDecoration(
            //             color: controller.itemf[index]['active'] == 1
            //                 ? AppColor.blue
            //                 : null,
            //             border: Border.all(color: AppColor.blue),
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Text(
            //           controller.itemf[index]['name'],
            //           style: Theme.of(context).textTheme.displayMedium,
            //         ),
            //       ),
            //     )),

            );
      }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.blue,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              minWidth: 300,
              onPressed: () {
                Get.offNamed(AppRoute.cart);
                // cartController.refreshPage();
              },
              child: Text(
                '45'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          GetBuilder<FavoriteController>(builder: (controller) {
            return IconButton(
                onPressed: () {
                  if (controller.isFav[pcontroller.productModel.id] == '0') {
                    controller.setFavorite(pcontroller.productModel.id!, '1');
                    controller.addFavorite(pcontroller.productModel.id!);
                  } else {
                    controller.setFavorite(pcontroller.productModel.id!, '0');
                    controller.deleteFavorite(pcontroller.productModel.id!);
                  }
                },
                icon: controller.isFav[pcontroller.productModel.id] == '0'
                    ? const Icon(Icons.favorite_outline_rounded)
                    : const Icon(Icons.favorite));
          }),
        ],
      ),
    );
  }
}
