import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  final BuildContext context;
  final String searchHint;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? searchonPressed;

  const CustomAppbar({
    super.key,
    required this.context,
    required this.searchHint,
    required this.controller,
    required this.onChanged,
    required this.searchonPressed,
  });

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController =
        Get.put(NotificationController());
    CartController cartController = Get.put(CartController());
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
            child: TextFormField(
              style: Theme.of(context).textTheme.displayMedium,
              controller: controller,
              onChanged: onChanged,
              cursorColor: AppColor.primaryColor,
              decoration: InputDecoration(
                hintText: searchHint,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                fillColor: AppColor.secondaryColor,
                iconColor: AppColor.primaryColor,
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: searchonPressed,
                ),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    Get.toNamed(AppRoute.notification);
                    notificationController.getData();
                  },
                  icon: const Icon(
                    Icons.notifications_active_rounded,
                    color: AppColor.primaryColor,
                    size: 25,
                  )),
            ),
            Positioned(
                top: 5,
                left: 5,
                child:
                    GetBuilder<NotificationController>(builder: (controller) {
                  return Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      '${controller.dataList.length}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(height: 1),
                    ),
                  );
                })),
          ],
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                iconSize: 30,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                  //cartController.refreshPage();
                },
                icon: const Icon(
                  Icons.shopping_basket_rounded,
                  size: 25,
                ),
                color: AppColor.primaryColor,
              ),
            ),
            Positioned(
                top: 5,
                left: 5,
                child: GetBuilder<CartController>(builder: (controller) {
                  return Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      '${controller.prosAmount}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(height: 1),
                    ),
                  );
                })),
          ],
        ),
      ],
    );
  }
}
