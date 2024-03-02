import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBottomAppBar extends GetView<CartController> {
  // final TextEditingController textController;
  // final void Function()? onApply;
  final String price;
  final String discount;
  final String shipping;
  final String deliveryPrice;
  final String total;
  final void Function()? goToCheckout;
  const CartBottomAppBar({
    super.key,
    // required this.textController,
    // required this.onApply,
    required this.price,
    required this.discount,
    required this.shipping,
    required this.deliveryPrice,
    required this.total,
    required this.goToCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '90'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '$price\$',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '153'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                discount,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '152'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '$shipping\$',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '164'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '$deliveryPrice\$',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          const Divider(
            color: AppColor.secondaryColor,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '91'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '$total\$',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          MaterialButton(
            minWidth: 200,
            onPressed: goToCheckout,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: AppColor.primaryColor,
            splashColor: AppColor.secondaryColor,
            child: Text(
              '69'.tr,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
