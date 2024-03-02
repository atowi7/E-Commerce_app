import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/view/widget/cart/cart_bottomappbar.dart';
import 'package:ecommerce_app/view/widget/cart/cart_productsection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text('46'.tr),
      ),
      body: GetBuilder<CartController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(8),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    '${'47'.tr} ${controller.prosAmount} ${'48'.tr}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ...List.generate(
                    controller.dataList.length,
                    (index) => CartProductSection(
                          title: langTranslateDataBase(
                              controller.dataList[index].proNameAr!,
                              controller.dataList[index].proNameAr!),
                          price: '${controller.dataList[index].proPrice}',
                          image: '${controller.dataList[index].proImage}',
                          amount: '${controller.dataList[index].prosCount}',
                          onPressedAdd: () async {
                            await controller
                                .addCart(controller.dataList[index].proId!);
                            controller.refreshPage();
                          },
                          onPressedDelete: () async {
                            await controller
                                .deleteCart(controller.dataList[index].proId!);
                            controller.refreshPage();
                          },
                        )),
                controller.couponName == 'invalid' ||
                        controller.couponName == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 4,
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: controller.couponController,
                                decoration: InputDecoration(
                                  hintStyle:
                                      Theme.of(context).textTheme.displayMedium,
                                  labelStyle:
                                      Theme.of(context).textTheme.displayMedium,
                                  hintText: '154'.tr,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  focusColor: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                              flex: 2,
                              child: MaterialButton(
                                onPressed: () {
                                  controller.applyCoupon();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                color: AppColor.primaryColor,
                                splashColor: AppColor.secondaryColor,
                                child: Text(
                                  '155'.tr,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              )),
                        ],
                      )
                    : Center(
                        child: Text(
                          '${'154'.tr} : ${controller.couponName}',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: CartBottomAppBar(
            // textController: controller.couponController!,
            // onApply: () {

            // },
            price: '${controller.totalPrice}',
            discount: '${controller.couponDiscount}',
            shipping: '${controller.shippingPrice}',
            deliveryPrice: '${controller.deliveryPrice}',
            total: '${controller.getTotalPrice()}',
            goToCheckout: () {
              controller.goToCheckout();
            },
          ),
        );
      }),
    );
  }
}
