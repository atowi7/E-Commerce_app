import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/ordersarchive_data.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:get/get.dart';

abstract class BaseOrdersArchiveController extends GetxController {
  viewOrders();
  refreshPage();
  String getDeliveryType(String val);
  String getPaymentMethod(String val);
  String getStatus(String val);
  // goToOrderDetails();
}

class OrdersArchiveController extends BaseOrdersArchiveController {
  List<OrderModel> dataList = [];
  AppServices appServices = Get.find();

  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  late StatusRequest statusRequest;
  @override
  void onInit() {
    viewOrders();
    super.onInit();
  }

  @override
  viewOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .getData(appServices.sharedPreferences.getString('userid')!);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  String getDeliveryType(String val) {
    if (val == '0') {
      return 'delivery';
    } else {
      return 'Myself';
    }
  }

  @override
  String getPaymentMethod(String val) {
    if (val == '0') {
      return '61'.tr;
    } else {
      return '62'.tr;
    }
  }

  @override
  String getStatus(String val) {
    if (val == '0') {
      return '124'.tr;
    } else if (val == '1') {
      return '125'.tr;
    } else if (val == '2') {
      return '126'.tr;
    } else if (val == '3') {
      return '127'.tr;
    } else {
      return '128'.tr;
    }
  }

  @override
  refreshPage() {
    viewOrders();
  }
}
