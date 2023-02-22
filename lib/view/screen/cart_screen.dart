import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/view/widget/cart/cart_bottomappbar.dart';
import 'package:ecommerce_app/view/widget/cart/cart_productsection.dart';
import 'package:ecommerce_app/view/widget/cart/cart_topappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
        body: ListView(
          children: [
            const CartTopAppBar(
              title: 'Cart',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'You have ${controller.prosAmount} products',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(
                controller.dataList.length,
                (index) => CartProductSection(
                      title: '${controller.dataList[index].proName}',
                      price: '${controller.dataList[index].proPrice}',
                      image: '${controller.dataList[index].proImage}',
                      amount: '${controller.dataList[index].proCount}',
                    )),
          ],
        ),
        bottomNavigationBar: CartBottomAppBar(
          price: '${controller.totalPrice}',
          shipping: '${controller.shipping}',
          total: '${controller.totalPrice+controller.shipping}',
        ),
      );
    });
  }
}
