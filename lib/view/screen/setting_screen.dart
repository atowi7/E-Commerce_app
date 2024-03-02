import 'package:ecommerce_app/controller/setting_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            // CustomAppbar(
            //   searchHint: 'Find products',
            //   controller: TextEditingController(),
            //   onChanged: null,
            //   searchonPressed: () {},
            // ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  border: Border.all(color: AppColor.primaryColor, width: 2.5),
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColor.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: settingController.userImage == 'default'
                        ? const Icon(
                            Icons.person_2_outlined,
                            size: 50,
                          )
                        : Image.network(
                            settingController.userImage,
                            height: 100,
                            width: 100,
                          ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    settingController.userName,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
            GetBuilder<SettingController>(builder: (controller) {
              return ListTile(
                title: Text(
                  '121'.tr,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                trailing: Switch(
                  value: controller.value,
                  activeColor: AppColor.primaryColor,
                  onChanged: (value) {
                    controller.displayNotification(value);
                  },
                ),
              );
            }),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoute.addressview);
              },
              title: Text(
                '50'.tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              trailing: const Icon(
                Icons.location_on_outlined,
                color: AppColor.primaryColor,
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoute.ordersArchive);
              },
              title: Text(
                '128'.tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              trailing: const Icon(
                Icons.archive_outlined,
                color: AppColor.primaryColor,
              ),
            ),
            ListTile(
              onTap: () {
                settingController.contactUs();
              },
              title: Text(
                '120'.tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              trailing: const Icon(
                Icons.contact_mail_outlined,
                color: AppColor.primaryColor,
              ),
            ),
            ListTile(
              onTap: () {
                settingController.logout();
              },
              title: Text(
                '122'.tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              trailing: const Icon(
                Icons.logout_outlined,
                color: AppColor.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
