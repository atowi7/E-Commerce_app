import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/orders_data.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:get/get.dart';

abstract class BaseOrdersController extends GetxController {
  viewOrders();
  deleteOrders(String orderId);
  refreshPage();
  String getDeliveryType(String val);
  String getPaymentMethod(String val);
  String getStatus(String val);
  goToOrderDetails();
}

class OrdersController extends BaseOrdersController {
  List<OrderModel> dataList = [];
  AppServices appServices = Get.find();

  OrdersData ordersdata = OrdersData(Get.find());

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
    var response = await ordersdata
        .getData(appServices.sharedPreferences.getString('userid')!);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr);
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  deleteOrders(String orderId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersdata.deleteOrder(orderId);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        refreshPage();
        Get.snackbar('39'.tr, '138'.tr);
      } else {
        Get.snackbar('94'.tr, '139'.tr);
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr);
    }
    update();
  }

  @override
  String getDeliveryType(String val) {
    if (val == '0') {
      return '64'.tr;
    } else {
      return '65'.tr;
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

  @override
  goToOrderDetails() {
    // Get.toNamed(AppRoute.ordersDetails, arguments: {
    //   'orderModel': dataList,
    // });
  }
}
