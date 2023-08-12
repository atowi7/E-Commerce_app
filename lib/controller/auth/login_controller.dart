import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseLoginController extends GetxController {
  showPassword();
  login();
  signInWithGoogle();
  openSignUp();
  openForgetPassword();
}

class LoginController extends BaseLoginController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController pass;

  bool isPassHidden = true;

  LoginData loginData = LoginData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  AppServices appServices = Get.find();

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();

    super.onInit();
  }

  @override
  showPassword() {
    isPassHidden == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, pass.text);

      statusRequest = handleData(response);
      print(statusRequest);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['data']['user_approval'] == '1') {
            appServices.sharedPreferences
                .setString('userid', response['data']['user_id']);
            appServices.sharedPreferences
                .setString('username', response['data']['user_name']);
            appServices.sharedPreferences
                .setString('userimage', response['data']['user_image']);

            appServices.sharedPreferences.setString('page', 'h');

            String userid = appServices.sharedPreferences.getString('userid')!;
            FirebaseMessaging.instance.subscribeToTopic('users');
            FirebaseMessaging.instance.subscribeToTopic('user$userid');

            Get.offNamed(AppRoute.homePage);
          } else {
            Get.offNamed(AppRoute.signupVerfication, arguments: {
              'email': email.text,
            });
          }
        } else {
          Get.defaultDialog(title: '94'.tr, middleText: '95'.tr);
          //statusRequest = StatusRequest.noDataFailure;
        }
      } else {
        Get.defaultDialog(title: '94'.tr, middleText: '96'.tr);
      }
    } else {
     // Get.defaultDialog(title: '94'.tr, middleText: '97'.tr);
    }
    update();
  }

  @override
  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;

      appServices.sharedPreferences.setString('userid', user!.uid);
      appServices.sharedPreferences.setString('username', user.displayName!);
      appServices.sharedPreferences.setString('userimage', user.photoURL!);
      appServices.sharedPreferences.setString('page', 'h');

      String userid = appServices.sharedPreferences.getString('userid')!;
      FirebaseMessaging.instance.subscribeToTopic('users');
      FirebaseMessaging.instance.subscribeToTopic('user$userid');

      Get.offNamed(AppRoute.homePage);

      // print(user);
    } catch (e) {
      Get.defaultDialog(title: '94'.tr, middleText: '96'.tr);
      statusRequest = StatusRequest.serverFailure;
    }
  }

  @override
  openSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  openForgetPassword() {
    Get.offNamed(AppRoute.checkemail);
  }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
}
