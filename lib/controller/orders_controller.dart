import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders_data.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:get/get.dart';

abstract class BaseOrdersController extends GetxController {
  viewOrders();
  refreshPage();
  String getDeliveryType(String val);
  String getPaymentMethod(String val);
  String getStatus(String val);
}

class OrdersController extends BaseOrdersController {
  List<OrderModel> dataList = [];
  OrderModel? couponModel;
  AppServices appServices = Get.find();

  OrderData ordersdata = OrderData(Get.find());

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
      //statusRequest = StatusRequest.serverFailure;
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
      return 'cash';
    } else {
      return 'card';
    }
  }

  @override
  String getStatus(String val) {
    if (val == '0') {
      return 'waitting for approval';
    } else if (val == '1') {
      return 'preparing';
    } else if (val == '2') {
      return 'On the way';
    } else {
      return 'Archive';
    }
  }
  
  @override
  refreshPage() {
    viewOrders();
  }
}
