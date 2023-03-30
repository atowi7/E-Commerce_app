import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';

abstract class BaseNotificationController extends GetxController {
  getData();
}

class NotificationController extends BaseNotificationController {
  List dataList = [];

  AppServices appServices = Get.find();

  NotificationData notificationData = NotificationData(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData
        .getData(appServices.sharedPreferences.getString('userid')!);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        dataList.clear();
        dataList.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
