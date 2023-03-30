import 'package:ecommerce_app/controller/orders_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
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
        ],
      ),
    );
  }
}
