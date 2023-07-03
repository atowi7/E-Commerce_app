import 'package:ecommerce_app/controller/orders/ordersarchive_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rating_dialog/rating_dialog.dart';

class OrderArchiveWedget extends GetView<OrdersArchiveController> {
  final OrderModel orderModel;
  const OrderArchiveWedget({super.key, required this.orderModel});
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
              // if (orderModel.ordersRate == '0')
              //   MaterialButton(
              //       onPressed: () {
              //         final dailog = RatingDialog(
              //             initialRating: 1.0,
              //             title: Text(
              //               '81'.tr,
              //               textAlign: TextAlign.center,
              //               style: Theme.of(context).textTheme.displayLarge,
              //             ),
              //             message: Text(
              //               '82'.tr,
              //               textAlign: TextAlign.center,
              //             ),
              //             submitButtonText: '83'.tr,
              //             submitButtonTextStyle:
              //                 const TextStyle(color: AppColor.blue),
              //             onSubmitted: (value) {
              //               if (value.rating == 0.0) {
              //                 Get.snackbar('84'.tr, '85'.tr);
              //               } else {
              //                 controller.sendRatring(orderModel.ordersId!,
              //                     value.rating, value.comment);
              //               }
              //             });
              //         showDialog(
              //             context: context,
              //             barrierDismissible: true,
              //             builder: (context) => dailog);
              //       },
              //       color: AppColor.blue,
              //       child: Text('86'.tr)),
              MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails, arguments: {
                      'orderModel': orderModel,
                    });
                  },
                  color: AppColor.blue,
                  child: Text('77'.tr)),
            ],
          ),
        ],
      ),
    );
  }
}
