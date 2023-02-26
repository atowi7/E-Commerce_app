import 'package:ecommerce_app/controller/setting_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    return ListView(
      children: [
        CustomAppbar(
          searchHint: 'Find products',
          controller: TextEditingController(),
          onChanged: null,
          searchonPressed: () {},
          notifyPressed: () {},
          favPressed: () {
            Get.toNamed(AppRoute.userfavorite);
          },
        ),
        Container(
          padding: const EdgeInsets.all(50),
          decoration:const  BoxDecoration(
            color: AppColor.blue,
          ),
          child: Lottie.asset(ImageAssets.profile),
        ),
        ...List.generate(
            settingController.sections.length,
            (index) => ListTile(
              onTap: ()=>Get.toNamed(AppRoute.addressview),
                  title: Text(settingController.sections[index]['title']),
                  trailing: Icon(settingController.sections[index]['icon']),
                ))
      ],
    );
  }
}
