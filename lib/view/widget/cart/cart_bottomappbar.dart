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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.blue, width: 2),
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
                        decoration: const InputDecoration(hintText: 'Coupon'),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: MaterialButton(
                          color: AppColor.blue,
                          onPressed: onApply,
                          child: const Text('Apply'),
                        )),
                  ],
                )
              : Text(
                  'Coupon ${controller.couponName}',
                  style: const TextStyle(color: AppColor.blue),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$price\$'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Discount',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(discount),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shipping',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$shipping\$'),
            ],
          ),
          const Divider(
            color: AppColor.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$total\$'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(
              onPressed: goToCheckout,
              child: const Text(
                'Order',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
