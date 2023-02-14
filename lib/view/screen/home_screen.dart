import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[600],
                          prefixIcon: const Icon(Icons.search_outlined),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(20)),
                    child: const IconButton(
                        iconSize: 30,
                        onPressed: null,
                        icon: Icon(Icons.notifications_active_outlined)),
                  ),
                ],
              ),
              Container(
                height: 100,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const ListTile(
                  leading: Text(
                    'Discount Summer',
                    style: TextStyle(fontSize: 30),
                  ),
                  trailing: Text(
                    '20 %',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColor.blue,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.black),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.network(
                                '${AppLink.categrieImage}/${controller.categories[index]['image']}',
                                color: AppColor.white,
                              ),
                              Text(
                                '${controller.categories[index]['name']}',
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: controller.categories.length),
              ),
              const Text(
                'Suggestions for products',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: AppColor.blue,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColor.black),
                              ),
                              child: Image.network(
                                '${AppLink.itemImage}/${controller.items[index]['image']}',
                                color: AppColor.white,
                              ),
                            ),
                            Positioned(
                              left: 10,
                              child: Text(
                                '${controller.items[index]['name']}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              color: Colors.black,
                            ),
                          ],
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: controller.categories.length),
              ),
            ],
          ),
        );
      }),
    );
  }
}
