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
                'Order Number : ${orderModel.ordersId}',
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
          Text('Order price : ${orderModel.ordersPrice}'),
          Text('Order delivery price : ${orderModel.ordersDeliveryprice}\$'),
          Text(
              'Order payment method : ${controller.getPaymentMethod(orderModel.ordersPaymentmethod!)}'),
          Text(
              'Order delivery type : ${controller.getDeliveryType(orderModel.ordersType!)}'),
          Text(
              'Order order status : ${controller.getStatus(orderModel.ordersStatus!)}'),
          const Divider(color: AppColor.blue),
          Text('Order total price : ${orderModel.ordersTotalprice}\$'),
          const Divider(color: AppColor.blue),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (orderModel.ordersRate == '0')
                MaterialButton(
                    onPressed: () {
                      final dailog = RatingDialog(
                          initialRating: 1.0,
                          title: Text(
                            'Rate your order',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          message: Text(
                            'Tap a star to set your rating, add more description here if you want',
                            textAlign: TextAlign.center,
                          ),
                          submitButtonText: 'Send',
                          submitButtonTextStyle:
                              const TextStyle(color: AppColor.blue),
                          onSubmitted: (value) {
                            if (value.rating == 0.0) {
                              Get.snackbar('NOTFY', 'Please rate your order');
                            } else {
                              controller.sendRatring(orderModel.ordersId!,
                                  value.rating, value.comment);
                            }
                          });
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => dailog);
                    },
                    color: AppColor.blue,
                    child: Text('Rate')),
              MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails, arguments: {
                      'orderModel': orderModel,
                    });
                  },
                  color: AppColor.blue,
                  child: Text('Details')),
            ],
          ),
        ],
      ),
    );
  }
}
