import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

abstract class BaseSettingController extends GetxController {
  displayNotification(bool val);
  contactUs();
  logout();
}

class SettingController extends BaseSettingController {
  late String userid;
  late String userName;
  late String userImage;

  bool value = false;
  // List sections = [
  //   {
  //     'title': '119'.tr,
  //     'icon': Icons.details_outlined,
  //     'onpress': () {},
  //   },
  //   {
  //     'title': '120'.tr,
  //     'icon': Icons.contact_page_rounded,
  //     'onpress': () {},
  //   },
  //   {
  //     'title': '50'.tr,
  //     'icon': Icons.location_on_outlined,
  //     'onpress': () {},
  //   },
  //   {
  //     'title': '121'.tr,
  //     'icon': Icons.notifications_paused_outlined,
  //     'onpress': () {},
  //   },
  //   {
  //     'title': '122'.tr,
  //     'icon': Icons.logout_outlined,
  //     'onpress': () {},
  //   }
  // ];
  AppServices appServices = Get.find();

  @override
  void onInit() {
    userid = appServices.sharedPreferences.getString('userid')!;
    userName = appServices.sharedPreferences.getString('username')!;
    userImage = 'default';
    super.onInit();
  }

  @override
  displayNotification(val) {
    value = val;
    print(value);
    if (value == true) {
      //FirebaseMessaging.instance.subscribeToTopic('user$userid');
    } else {
      // FirebaseMessaging.instance.unsubscribeFromTopic('user$userid');
    }

    update();
  }

  @override
  contactUs() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'dhoom.sedge@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'E-commerce App',
        'body': 'Contact Us',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  @override
  logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('user$userid');

    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();

    appServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
