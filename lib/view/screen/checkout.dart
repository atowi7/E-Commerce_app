import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/view/widget/checkout/addressbox.dart';
import 'package:ecommerce_app/view/widget/checkout/cardbox.dart';
import 'package:ecommerce_app/view/widget/checkout/cashbox.dart';
import 'package:ecommerce_app/view/widget/checkout/deliverybox.dart';
import 'package:ecommerce_app/view/widget/checkout/myselfbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
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
                  controller.choosePyamentMethod('card');
                },
                child: CardBox(
                    title: 'Card',
                    active: controller.payment == 'card' ? true : false),
              ),
              InkWell(
                onTap: () {
                  controller.choosePyamentMethod('cash');
                },
                child: CashBox(
                    title: 'Cash',
                    active: controller.payment == 'cash' ? true : false),
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
                      controller.chooseDeliveryType('delivery');
                    },
                    child: DeliveryBox(
                        title: 'Delivery',
                        active:
                            controller.delivery == 'delivery' ? true : false)),
                InkWell(
                    onTap: () {
                      controller.chooseDeliveryType('myself');
                    },
                    child: MySelfBox(
                        title: 'My self',
                        active:
                            controller.delivery == 'myself' ? true : false)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (controller.delivery == 'delivery')
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
          onPressed: () {},
          child: const Text('Check out'),
        ),
      ),
    );
  }
}
