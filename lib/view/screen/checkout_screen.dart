import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
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
        title: const Text('Check out'),
      ),
      body: GetBuilder<CheckoutController>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(5),
          child: ListView(children: [
            Text(
              'Choose Payment Method',
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
                    title: 'Card',
                    active: controller.payment == '0' ? true : false),
              ),
              InkWell(
                onTap: () {
                  controller.choosePyamentMethod('1');
                },
                child: CashBox(
                    title: 'Cash',
                    active: controller.payment == '1' ? true : false),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Choose Delivery Type',
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
                        title: 'Delivery',
                        active: controller.deliveryType == '0' ? true : false)),
                InkWell(
                    onTap: () {
                      controller.chooseDeliveryType('1');
                    },
                    child: MySelfBox(
                        title: 'My self',
                        active: controller.deliveryType == '1' ? true : false)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (controller.deliveryType == '0')
              Column(
                children: [
                  Text(
                    'Choose Shipping Address',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                    controller.dataList.length,
                    (index) => InkWell(
                      onTap: () {
                        controller.chooseShippingAdderss(
                            '${controller.dataList[index].addressId}');
                      },
                      child: AddressBox(
                        title: '${controller.dataList[index].addressName}',
                        description:
                            '${controller.dataList[index].addressCity} / ${controller.dataList[index].addressStreet}',
                        active: controller.addressId ==
                                controller.dataList[index].addressId
                            ? true
                            : false,
                      ),
                    ),
                  )
                ],
              ),
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
          child: const Text('Check out'),
        ),
      ),
    );
  }
}
