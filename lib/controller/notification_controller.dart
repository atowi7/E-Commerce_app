import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/notification_data.dart';
import 'package:ecommerce_app/data/model/notificationmodel.dart';
import 'package:get/get.dart';

abstract class BaseNotificationController extends GetxController {
  getData();
  deleteData(String id);
}

class NotificationController extends BaseNotificationController {
  late String userid;
  List<NotificationModel> dataList = [];

  AppServices appServices = Get.find();

  NotificationData notificationData = NotificationData(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    userid = appServices.sharedPreferences.getString('userid')!;
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await notificationData.getData(userid);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr, duration: const Duration(seconds: 2));
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }

  @override
  deleteData(id) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await notificationData.deleteData(id, userid);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('39'.tr, '148'.tr, duration: const Duration(seconds: 2));
        getData();
      } else {
        Get.snackbar('39'.tr, '149'.tr, duration: const Duration(seconds: 2));
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr, duration: const Duration(seconds: 2));
    }
  }
}
