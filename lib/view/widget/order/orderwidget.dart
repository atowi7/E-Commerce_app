import 'package:ecommerce_app/controller/orders/orders_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderWedget extends GetView<OrdersController> {
  final OrderModel orderModel;
  const OrderWedget({super.key, required this.orderModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                '${'70'.tr} : ${orderModel.ordersId}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Spacer(),
              Text(
                Jiffy.parse(orderModel.ordersCreatedat!).fromNow(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          const Divider(color: AppColor.blue),
          Text('${'71'.tr} : ${orderModel.ordersPrice}'),
          Text('${'72'.tr} : ${orderModel.ordersDeliveryprice}\$'),
          Text(
              '${'73'.tr} : ${controller.getPaymentMethod(orderModel.ordersPaymentmethod!)}'),
          Text(
              '${'74'.tr} : ${controller.getDeliveryType(orderModel.ordersType!)}'),
          Text(
              '${'75'.tr} : ${controller.getStatus(orderModel.ordersStatus!)}'),
          const Divider(color: AppColor.blue),
          Text('${'76'.tr} : ${orderModel.ordersTotalprice}\$'),
          const Divider(color: AppColor.blue),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails, arguments: {
                      'orderModel': orderModel,
                    });
                  },
                  color: AppColor.blue,
                  child: Text('77'.tr)),
              if (orderModel.ordersStatus == '3')
                MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersTracking, arguments: {
                        'orderModel': orderModel,
                      });
                    },
                    color: AppColor.blue,
                    child: Text('78'.tr)),
              if (orderModel.ordersStatus == '0')
                MaterialButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: '39'.tr,
                        titleStyle: Theme.of(context).textTheme.displayMedium,
                        middleText: '40'.tr,
                        middleTextStyle:
                            Theme.of(context).textTheme.displaySmall,
                        onConfirm: () {
                          controller.deleteOrders(orderModel.ordersId!);
                        },
                        confirmTextColor: AppColor.blue,
                        cancelTextColor: AppColor.blue,
                        buttonColor: AppColor.white,
                        onCancel: () {
                          Get.back();
                        },
                      );
                    },
                    color: AppColor.blue,
                    child: Text('79'.tr))
            ],
          ),
        ],
      ),
    );
  }
}
