import 'package:ecommerce_app/controller/orders_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewOrdersScreen extends StatelessWidget {
  const ViewOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: GetBuilder<OrdersController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.dataList.length,
            itemBuilder: (context, i) =>
                OrderWedget(orderModel: controller.dataList[i]),
          ),
        );
      }),
    );
  }
}

class OrderWedget extends GetView<OrdersController> {
  final OrderModel orderModel;
  const OrderWedget({super.key, required this.orderModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Order Number : ${orderModel.ordersId}',
            style: Theme.of(context).textTheme.displayMedium,
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
