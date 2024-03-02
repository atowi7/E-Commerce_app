import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/message_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseChatController extends GetxController {
  sendMessage(String message);
}

class ChatController extends BaseChatController {
  late String userId;
  late String admnId;

  var formKey = GlobalKey<FormState>();

  TextEditingController msgController = TextEditingController();

  AppServices appServices = Get.find();

  MessageData messageData = MessageData(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    // userId = appServices.sharedPreferences.getString('userid')!;
    // admnId = Get.arguments['adminid'];
    
    super.onInit();
  }

  @override
  sendMessage(String message) async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await messageData.sendMessage(message, admnId, userId);

      statusRequest = handleData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.snackbar('39'.tr, '167'.tr, duration: const Duration(seconds: 2));
        } else {
          Get.snackbar('94'.tr, '168'.tr, duration: const Duration(seconds: 2));
        }
      } else {
        Get.snackbar('94'.tr, '96'.tr, duration: const Duration(seconds: 2));
      }
      update();
    }
  }
}
