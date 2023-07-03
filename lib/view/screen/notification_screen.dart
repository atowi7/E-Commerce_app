import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/notificationmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(title: Text('137'.tr)),
      body: GetBuilder<NotificationController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              ...List.generate(
                  controller.dataList.length,
                  (index) => NotificationWidget(
                      notificationModel: controller.dataList[index],
                      onDelete: () {
                        Get.defaultDialog(
                          title: '39'.tr,
                          titleStyle: Theme.of(context).textTheme.displayMedium,
                          middleText: '40'.tr,
                          middleTextStyle:
                              Theme.of(context).textTheme.displaySmall,
                          onConfirm: () {
                            controller.deleteData(
                                controller.dataList[index].notificationId!);
                          },
                          confirmTextColor: AppColor.blue,
                          cancelTextColor: AppColor.blue,
                          buttonColor: AppColor.white,
                          onCancel: () {
                            Get.back();
                          },
                        );
                      })),
            ],
          ),
        );
      }),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  final NotificationModel notificationModel;
  final void Function()? onDelete;
  const NotificationWidget(
      {super.key, required this.notificationModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
          title: Text(
            '${notificationModel.notificationTitle}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          subtitle: Column(
            children: [
              Text(
                '${notificationModel.notificationBody}',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                  Jiffy.parse(notificationModel.notificationCreatedat!)
                      .fromNow(),
                  style: Theme.of(context).textTheme.displaySmall),
            ],
          ),
          trailing: IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_forever_rounded))),
    );
  }
}
