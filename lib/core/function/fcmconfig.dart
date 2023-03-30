import 'package:ecommerce_app/controller/orders_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

notificationPermission() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    Get.snackbar(
        remoteMessage.notification!.title!, remoteMessage.notification!.body!);
    FlutterRingtonePlayer.playNotification();
    if (remoteMessage.data['pagename'] == 'order' &&
        Get.currentRoute == '/orderview') {
      OrdersController ordersController = Get.find();
      ordersController.refreshPage();
    }
  });
}
