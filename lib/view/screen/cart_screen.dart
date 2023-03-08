import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/view/widget/cart/cart_bottomappbar.dart';
import 'package:ecommerce_app/view/widget/cart/cart_productsection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Cart'),
            IconButton(
                iconSize: 30,
                onPressed: () {
                  Get.toNamed(AppRoute.ordersView);
                },
                icon: const Icon(Icons.shopping_bag_rounded)),
          ],
        ),
      ),
      body: GetBuilder<CartController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              Text(
                'You have ${controller.prosAmount} products',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 10,
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
                        onPressedAdd: () {
                          controller.addCart(controller.dataList[index].proId!);
                          controller.refreshPage();
                        },
                        onPressedDelete: () {
                          controller
                              .deleteCart(controller.dataList[index].proId!);
                          controller.refreshPage();
                        },
                      )),
            ],
          ),
        );
      }),
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: CartBottomAppBar(
            textController: controller.couponController!,
            onApply: () {
              controller.applyCoupon();
            },
            price: '${controller.totalPrice}',
            discount: '${controller.couponDiscount}',
            shipping: '${controller.shipping}',
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
