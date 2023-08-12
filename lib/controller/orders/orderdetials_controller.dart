import 'dart:async';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/ordersdetails_data.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:ecommerce_app/data/model/ordersdetailsmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BaseOrderDetialsController extends GetxController {
  viewOrderDetails();
}

class OrderDetialsController extends BaseOrderDetialsController {
  late OrderModel orderModel;
  List<OrdersDetailsModel> dataList = [];
  AppServices appServices = Get.find();

  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  late StatusRequest statusRequest;

  Completer<GoogleMapController> mapcontroller =
      Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;

  Set<Marker> markers = {};

  double? lat;
  double? long;

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    viewOrderDetails();
    if (orderModel.ordersType == '0') {
      kGooglePlex = CameraPosition(
        target: LatLng(double.parse(orderModel.addressLat!),
            double.parse(orderModel.addressLong!)),
        zoom: 15,
      );
      markers.add(Marker(
          markerId: const MarkerId('m1'),
          position: LatLng(double.parse(orderModel.addressLat!),
              double.parse(orderModel.addressLong!))));
    }

    super.onInit();
  }

  @override
  viewOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersDetailsData.getData(orderModel.ordersId!);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr, duration: const Duration(seconds: 2));
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }
}
