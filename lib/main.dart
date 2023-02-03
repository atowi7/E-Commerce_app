import 'package:ecommerce_app/binding/binding.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/localization/localalngchange.dart';
import 'package:ecommerce_app/core/localization/translations.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/view/screen/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalLangChange controller = Get.put(LocalLangChange());
    return GetMaterialApp(
      title: 'ECommerceApp',
      theme: controller.appTheme,
      locale: controller.localeLangauge,
      translations: AppTranslations(),
      initialRoute: AppRoute.language,
      initialBinding: Binding(),
      // home: const LanguageScreen(),
      // routes: routes,
      getPages: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
