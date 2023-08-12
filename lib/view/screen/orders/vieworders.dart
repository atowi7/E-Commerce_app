import 'package:ecommerce_app/controller/orders/orders_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/order/orderwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewOrdersScreen extends StatelessWidget {
  const ViewOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            CustomAppbar(
              context: context,
              searchHint: '41'.tr,
              controller: TextEditingController(),
              onChanged: null,
              searchonPressed: () {},
            ),
            GetBuilder<OrdersController>(builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: RefreshIndicator(
                  onRefresh: () async {
                    await controller.viewOrders();
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, i) =>
                        OrderWedget(orderModel: controller.dataList[i]),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
