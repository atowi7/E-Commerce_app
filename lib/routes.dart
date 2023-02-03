import 'package:ecommerce_app/core/middleware/firstmiddlewares.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword_screen.dart';
import 'package:ecommerce_app/view/screen/auth/login_screen.dart';
import 'package:ecommerce_app/view/screen/auth/resetpassword_screen.dart';
import 'package:ecommerce_app/view/screen/auth/signup_screen.dart';
import 'package:ecommerce_app/view/screen/auth/signup_verfication_screen.dart';
import 'package:ecommerce_app/view/screen/auth/sucessresetpasswordscreen.dart';
import 'package:ecommerce_app/view/screen/auth/sucesssignupscreen.dart';
import 'package:ecommerce_app/view/screen/auth/verfication_screen.dart';
import 'package:ecommerce_app/view/screen/language_screen.dart';
import 'package:ecommerce_app/view/screen/onboarding_screen.dart';

import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/view/widget/test_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.language,
    page: () => const TestView(),
    //page: () => const LanguageScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignupScreen(),
  ),
  GetPage(
    name: AppRoute.signupVerfication,
    page: () => const SignupVerficationScreen(),
  ),
  GetPage(
    name: AppRoute.successSignup,
    page: () => const SucessSignupScreen(),
  ),
  GetPage(
    name: AppRoute.forgetPasswoed,
    page: () => const ForgetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.verfication,
    page: () => const VerficationScreen(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.sucessResetPassword,
    page: () => const SucessResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.onBoarding,
    page: () => const OnBoardingScreen(),
  ),
];
