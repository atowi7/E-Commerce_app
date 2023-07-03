import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/view/widget/checkout/addressbox.dart';
import 'package:ecommerce_app/view/widget/checkout/cardbox.dart';
import 'package:ecommerce_app/view/widget/checkout/cashbox.dart';
import 'package:ecommerce_app/view/widget/checkout/deliverybox.dart';
import 'package:ecommerce_app/view/widget/checkout/myselfbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text('59'.tr),
      ),
      body: GetBuilder<CheckoutController>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(5),
          child: ListView(children: [
            
            Text(
              '63'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      controller.chooseDeliveryType('0');
                    },
                    child: DeliveryBox(
                        title: '64'.tr,
                        active: controller.deliveryType == '0' ? true : false)),
                InkWell(
                    onTap: () {
                      controller.chooseDeliveryType('1');
                    },
                    child: MySelfBox(
                        title: '65'.tr,
                        active: controller.deliveryType == '1' ? true : false)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (controller.deliveryType == '0')
              Column(
                children: [
                  controller.addressList.isNotEmpty
                      ? Text(
                          '66'.tr,
                          style: Theme.of(context).textTheme.displayLarge,
                        )
                      : Column(
                          children: [
                            Text(
                              '67'.tr,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            MaterialButton(
                                color: AppColor.blue,
                                onPressed: () {
                                  Get.toNamed(
                                    AppRoute.addressadd,
                                  );
                                },
                                child: Text(
                                  '68'.tr,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ))
                          ],
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                    controller.addressList.length,
                    (index) => InkWell(
                      onTap: () {
                        controller.chooseShippingAdderss(
                            '${controller.addressList[index].addressId}');
                      },
                      child: AddressBox(
                        title: '${controller.addressList[index].addressName}',
                        description:
                            '${controller.addressList[index].addressCity} / ${controller.addressList[index].addressStreet}',
                        active: controller.addressId ==
                                controller.addressList[index].addressId
                            ? true
                            : false,
                      ),
                    ),
                  )
                ],
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '60'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                onTap: () {
                  controller.choosePyamentMethod('0');
                },
                child: CardBox(
                    title: '61'.tr,
                    active: controller.payment == '0' ? true : false),
              ),
              InkWell(
                onTap: () {
                  controller.choosePyamentMethod('1');
                },
                child: CashBox(
                    title: '62'.tr,
                    active: controller.payment == '1' ? true : false),
              )
            ]),
          ]),
        );
      }),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: MaterialButton(
          onPressed: () {
            checkoutController.checkout();
          },
          child: Text('12'.tr),
        ),
      ),
    );
  }
}
