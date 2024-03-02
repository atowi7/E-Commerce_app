import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/productdetail_controller.dart';
import 'package:ecommerce_app/controller/userfavorite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/input_validation.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/view/widget/productdetail/Image_section.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailController pcontroller = Get.put(ProductDetailController());
    // UserFavoriteController userFavoriteController = Get.find();
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
              Text(
                '${langTranslateDataBase(controller.productModel.descriptionAr!, controller.productModel.description!)}',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),

              // AmountAndPriceSection(
              //   price: controller.productModel.priceafterdiscount!,
              //   count: controller.count,
              //   onPressedAdd: () {
              //     controller.addCount();
              //   },
              //   onPressedDelete: () {
              //     controller.deleteCount();
              //   },
              // ),

              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: AppColor.secondaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '90'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColor.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${controller.productModel.price!}\$',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              decoration:
                                  controller.productModel.discount != '0'
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                    ),
                    if (controller.productModel.discount != '0')
                      const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: AppColor.primaryColor,
                        size: 40,
                      ),
                    if (controller.productModel.discount != '0')
                      Text(
                        '${controller.productModel.priceafterdiscount!}\$',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColor.primaryColor),
                      ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: AppColor.secondaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '44'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColor.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${langTranslateDataBase(controller.productModel.color!, controller.productModel.color!)}',
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                    // Container(
                    //   height: 20,
                    //   width: 30,
                    //   decoration: BoxDecoration(
                    //       color: Color(int.parse(
                    //           '0xff${controller.productModel.color}')),
                    //       borderRadius: BorderRadius.circular(25)),
                    // )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: AppColor.secondaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '152'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColor.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      controller.productModel.shipping!,
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: AppColor.secondaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '164'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColor.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      controller.productModel.deliveryPrice!,
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: AppColor.secondaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '165'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColor.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                        onPressed: () {
                         Get.toNamed("page");
                        },
                        icon: const Icon(
                          Icons.message_rounded,
                          color: AppColor.primaryColor,
                        ))
                  ],
                ),
              ),
              // if (controller.productModel.rate == '-1')
              if (controller.enableRating)
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: Get.width * 0.2),
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
                                const TextStyle(color: AppColor.primaryColor),
                            onSubmitted: (value) {
                              if (value.rating == 0.0) {
                                Get.snackbar('84'.tr, '85'.tr,
                                    duration: const Duration(seconds: 2));
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: AppColor.primaryColor,
                      splashColor: AppColor.secondaryColor,
                      child: Text(
                        '86'.tr,
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                ),
            ],
          ),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: List.generate(
          //       controller.itemf.length,
          //       (index) => Container(
          //         padding: const EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //             color: controller.itemf[index]['active'] == 1
          //                 ? AppColor.primaryColor
          //                 : null,
          //             border: Border.all(color: AppColor.primaryColor),
          //             borderRadius: BorderRadius.circular(20)),
          //         child: Text(
          //           controller.itemf[index]['name'],
          //           style: Theme.of(context).textTheme.displayMedium,
          //         ),
          //       ),
          //     )),
        );
      }),
      bottomNavigationBar: Container(
        // width: Get.size.width * 0.5,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            pcontroller.addCart();
            // cartController.refreshPage();
          },
          color: AppColor.primaryColor,
          splashColor: AppColor.secondaryColor,
          child: Text(
            '45'.tr,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [

      //     GetBuilder<FavoriteController>(builder: (controller) {
      //       print(controller.isFav[pcontroller.productModel.id]);
      //       return IconButton(
      //           onPressed: () {
      //             if (controller.isFav[pcontroller.productModel.id] == '0') {
      //               controller.setFavorite(pcontroller.productModel.id!, '1');
      //               controller.addFavorite(pcontroller.productModel.id!);
      //             } else {
      //               controller.setFavorite(pcontroller.productModel.id!, '0');
      //               controller.deleteFavorite(pcontroller.productModel.id!);
      //             }
      //           },
      //           icon: controller.isFav[pcontroller.productModel.id] == '0'
      //               ? const Icon(
      //                   Icons.favorite_outline_rounded,
      //                   size: 35,
      //                 )
      //               : const Icon(
      //                   Icons.favorite,
      //                   color: AppColor.primaryColor,
      //                   size: 35,
      //                 ));
      //     }),
      //   ],
      // ),
    );
  }
}
