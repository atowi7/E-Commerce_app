import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

exitAppAlert(BuildContext context) {
  return Get.defaultDialog(
      title: '39'.tr,
      middleText: '40'.tr,
      titleStyle: Theme.of(context).textTheme.displayMedium,
      actions: [
        ElevatedButton(
            onPressed: () => exit(0),
            child: Text(
              '156'.tr,
              style: Theme.of(context).textTheme.labelMedium,
            )),
        ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(
              '157'.tr,
              style: Theme.of(context).textTheme.labelMedium,
            )),
      ]);
}
