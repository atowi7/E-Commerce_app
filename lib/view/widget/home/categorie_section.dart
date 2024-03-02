import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/data/model/categoriemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategorieSection extends StatelessWidget {
  const CategorieSection({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Container(
      height: Get.height * 0.12,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategorieWidget(
                categorieModel:
                    CategorieModel.fromJson(controller.categories[index]),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemCount: controller.categories.length),
    );
  }
}

class CategorieWidget extends GetView<HomeController> {
  final CategorieModel categorieModel;
  //final int i;
  const CategorieWidget({super.key, required this.categorieModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItem(controller.categories, categorieModel.id!);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.secondaryColor),
        ),
        child: Column(
          children: [
            SvgPicture.network(
              '${AppLink.categrieImage}/${categorieModel.image}',
              height: Get.height * 0.05,
              width: Get.width * 0.05,
            ),
            Text(
              langTranslateDataBase(
                  categorieModel.nameAr!, categorieModel.name!),
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }
}
