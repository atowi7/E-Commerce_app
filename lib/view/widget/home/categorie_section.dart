import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/data/model/categorie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategorieSection extends StatelessWidget {
  const CategorieSection({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategorieWidget(
                categorie:
                    CategorieModel.fromJson(controller.categories[index]),
                i: index,
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.categories.length),
    );
  }
}

class CategorieWidget extends GetView<HomeController> {
  final CategorieModel categorie;
  final int i;
  const CategorieWidget({super.key, required this.categorie, required this.i});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItem(controller.categories, i);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.black),
        ),
        child: Column(
          children: [
            SvgPicture.network(
              '${AppLink.categrieImage}/${categorie.image}',
              color: AppColor.white,
            ),
            Text(
              '${categorie.name}',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
