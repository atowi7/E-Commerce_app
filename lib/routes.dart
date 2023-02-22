import 'package:ecommerce_app/core/middleware/firstmiddlewares.dart';
import 'package:ecommerce_app/view/screen/cart_screen.dart';
import 'package:ecommerce_app/view/screen/forgetpassword/checkemail_screen.dart';
import 'package:ecommerce_app/view/screen/auth/login_screen.dart';
import 'package:ecommerce_app/view/screen/forgetpassword/resetpassword_screen.dart';
import 'package:ecommerce_app/view/screen/auth/signup_screen.dart';
import 'package:ecommerce_app/view/screen/auth/signup_verfication_screen.dart';
import 'package:ecommerce_app/view/screen/forgetpassword/sucessresetpasswordscreen.dart';
import 'package:ecommerce_app/view/screen/auth/sucesssignupscreen.dart';
import 'package:ecommerce_app/view/screen/forgetpassword/verfication_screen.dart';
import 'package:ecommerce_app/view/screen/homescreen.dart';
import 'package:ecommerce_app/view/screen/language_screen.dart';
import 'package:ecommerce_app/view/screen/onboarding_screen.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/view/screen/productdetial_screen.dart';
import 'package:ecommerce_app/view/screen/product_screen.dart';
import 'package:ecommerce_app/view/screen/userfavorite_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.language,
    page: () => const LanguageScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.onBoarding,
    page: () => const OnBoardingScreen(),
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
    name: AppRoute.checkemail,
    page: () => const CheckemailScreen(),
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
    name: AppRoute.homePage,
    page: () => const CartScreen(),
  ),
  GetPage(
    name: AppRoute.product,
    page: () => const ProductScreen(),
  ),
  GetPage(
    name: AppRoute.productdetail,
    page: () => const ProductDetailScreen(),
  ),
  GetPage(
    name: AppRoute.userfavorite,
    page: () => const UserFavoriteScreen(),
  ),
];
