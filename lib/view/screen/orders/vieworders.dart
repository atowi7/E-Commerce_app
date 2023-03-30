import 'package:ecommerce_app/controller/orders_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/order/orderwidget.dart';
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
