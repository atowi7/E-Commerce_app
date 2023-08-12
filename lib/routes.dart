import 'package:ecommerce_app/core/middleware/firstmiddlewares.dart';
import 'package:ecommerce_app/view/screen/address/address_view.dart';
import 'package:ecommerce_app/view/screen/address/addressdetail_add.dart';
import 'package:ecommerce_app/view/screen/address/address_edit.dart';
import 'package:ecommerce_app/view/screen/address/address_add.dart';
import 'package:ecommerce_app/view/screen/cart_screen.dart';
import 'package:ecommerce_app/view/screen/checkout_screen.dart';
import 'package:ecommerce_app/view/screen/forgetpassword/checkemail_screen.dart';
import 'package:ecommerce_app/view/screen/auth/login_screen.dart';
import 'package:ecommerce_app/view/screen/forgetpassword/resetpassword_screen.dart';
import 'package:ecommerce_app/view/screen/auth/signup_screen.dart';
import 'package:ecommerce_app/view/screen/auth/signupverification_screen.dart';
import 'package:ecommerce_app/view/screen/forgetpassword/successresetpasswordscreen.dart';
import 'package:ecommerce_app/view/screen/auth/successsignup_screen.dart';
import 'package:ecommerce_app/view/screen/forgetpassword/verification_screen.dart';
import 'package:ecommerce_app/view/screen/home_screen.dart';
import 'package:ecommerce_app/view/screen/language_screen.dart';
import 'package:ecommerce_app/view/screen/notification_screen.dart';
import 'package:ecommerce_app/view/screen/onboarding_screen.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/view/screen/orders/ordersarchive.dart';
import 'package:ecommerce_app/view/screen/orders/ordersdetails.dart';
import 'package:ecommerce_app/view/screen/orders/orderstracking.dart';
import 'package:ecommerce_app/view/screen/orders/vieworders.dart';
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
    page: () => const SignupVerificationScreen(),
  ),
  GetPage(
    name: AppRoute.successSignup,
    page: () => const SuccessSignupScreen(),
  ),
  GetPage(
    name: AppRoute.checkemail,
    page: () => const CheckEmailScreen(),
  ),
  GetPage(
    name: AppRoute.verfication,
    page: () => const VerificationScreen(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => const SuccessResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.homePage,
    page: () => const HomeScreen(),
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
  GetPage(
    name: AppRoute.notification,
    page: () => const NotificationScreen(),
  ),
  GetPage(
    name: AppRoute.cart,
    page: () => const CartScreen(),
  ),
  GetPage(
    name: AppRoute.addressview,
    page: () => const AddressView(),
  ),
  GetPage(
    name: AppRoute.addressadd,
    page: () => const AddressAdd(),
  ),
  GetPage(
    name: AppRoute.addressadddetail,
    page: () => const AddressDetailAdd(),
  ),
  GetPage(
    name: AppRoute.addressedit,
    page: () => const AddressEdit(),
  ),
  GetPage(
    name: AppRoute.ordersCheckout,
    page: () => const CheckOutScreen(),
  ),
  GetPage(
    name: AppRoute.ordersView,
    page: () => const ViewOrdersScreen(),
  ),
  GetPage(
    name: AppRoute.ordersArchive,
    page: () => const OrdersArchiveScreen(),
  ),
  GetPage(
    name: AppRoute.ordersDetails,
    page: () => const OrderDetailsScreen(),
  ),
  GetPage(
    name: AppRoute.ordersTracking,
    page: () => const OrderTrackingScreen(),
  ),
];
