import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController =
        Get.put(NotificationController());
    return GetBuilder<NotificationController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: notificationController.statusRequest,
        widget: ListView(
          children: [
            Center(
              child: Text(
                'Notification',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            ...List.generate(
                notificationController.dataList.length,
                (index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          '${notificationController.dataList[index]['notification_title']}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        subtitle: Text(
                          '${notificationController.dataList[index]['notification_body']}',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        trailing: Text(
                            Jiffy.parse(notificationController.dataList[index]
                                    ['notification_createdat'])
                                .fromNow(),
                            style: Theme.of(context).textTheme.displaySmall),
                      ),
                    )),
          ],
        ),
      );
    });
  }
}
