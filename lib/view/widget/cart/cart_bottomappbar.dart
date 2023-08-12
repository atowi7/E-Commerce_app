import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBottomAppBar extends GetView<CartController> {
  final TextEditingController textController;
  final void Function()? onApply;
  final String price;
  final String discount;
  final String shipping;
  final String total;
  final void Function()? goToCheckout;
  const CartBottomAppBar({
    super.key,
    required this.textController,
    required this.onApply,
    required this.price,
    required this.discount,
    required this.shipping,
    required this.total,
    required this.goToCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          controller.couponName == 'invalid' || controller.couponName == null
              ? Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: textController,
                        decoration: InputDecoration(hintText: '154'.tr),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: MaterialButton(
                          color: AppColor.primaryColor,
                          onPressed: onApply,
                          splashColor: AppColor.secondaryColor,
                          child: Text(
                            '155'.tr,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        )),
                  ],
                )
              : Text(
                  '${'154'.tr} ${controller.couponName}',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '90'.tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text('$price\$'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '153'.tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(discount),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '152'.tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text('$shipping\$'),
            ],
          ),
          const Divider(
            color: AppColor.secondaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '91'.tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text('$total\$'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: Get.size.width * 0.7,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
              onPressed: goToCheckout,
              splashColor: AppColor.secondaryColor,
              child: Text(
                '69'.tr,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
