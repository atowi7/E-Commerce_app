import 'package:ecommerce_app/controller/orders/orderdetials_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetialsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('87'.tr),
      ),
      body: GetBuilder<OrderDetialsController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Card(
                  child: Table(
                    children: [
                      TableRow(children: [
                        Text(
                          '88'.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColor.primaryColor),
                        ),
                        Text(
                          '89'.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColor.primaryColor),
                        ),
                        Text(
                          '90'.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ]),
                      ...List.generate(
                        controller.dataList.length,
                        (index) => TableRow(children: [
                          Text(
                            '${controller.dataList[index].proName}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            '${controller.dataList[index].prosCount}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            '${controller.dataList[index].prosPrice}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Card(
                    child: Text(
                      '${'91'.tr} : ${controller.orderModel.ordersTotalprice}\$',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ),
                ),
              ),
              if (controller.orderModel.ordersType == '0')
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        '92'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      subtitle: Text(
                        '${controller.orderModel.addressCity} ${controller.orderModel.addressStreet}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                ),
              if (controller.orderModel.ordersType == '0')
                Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Card(
                    child: GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: controller.kGooglePlex!,
                      onMapCreated: (GoogleMapController mapcontroller) {
                        controller.mapcontroller.complete(mapcontroller);
                      },
                      markers: controller.markers,
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
