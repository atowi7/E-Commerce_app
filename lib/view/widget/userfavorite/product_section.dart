import 'package:ecommerce_app/controller/userfavorite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/data/model/userfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserFavoriteController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: GridView.builder(
            itemCount: controller.datalist.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4),
            itemBuilder: (context, index) {
              return ProductWedget(
                userFavoriteModel: controller.datalist[index],
              );
            }),
      );
    });
  }
}

class ProductWedget extends GetView<UserFavoriteController> {
  final UserFavoriteModel userFavoriteModel;
  const ProductWedget({super.key, required this.userFavoriteModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductDetial(userFavoriteModel, 'tag_ufp');
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColor.primaryColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'tag_ufp_${userFavoriteModel.proId}',
                  child: CachedNetworkImage(
                    imageUrl:
                        '${AppLink.productImage}/${userFavoriteModel.proImage}',
                    height: 60,
                    width: 60,
                  ),
                ),
                Text(
                  langTranslateDataBase(
                      userFavoriteModel.proNameAr!, userFavoriteModel.proName!),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '42'.tr,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            5,
                            (index) => SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.star,
                                      color: AppColor.primaryColor,
                                    ),
                                    iconSize: 15,
                                  ),
                                ))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${userFavoriteModel.proPrice}\$',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    GetBuilder<UserFavoriteController>(builder: (controller) {
                      return IconButton(
                          onPressed: () {
                            controller.deletData(userFavoriteModel.favId!);
                          },
                          icon: const Icon(
                            Icons.delete_forever_rounded,
                            color: AppColor.primaryColor,
                          ));
                    })
                  ],
                ),
              ],
            ),
          ),
          if (userFavoriteModel.proDiscount != '0')
            const Positioned(
                top: 2,
                left: 4,
                child: Icon(
                  Icons.discount_rounded,
                  color: AppColor.primaryColor,
                )),
        ],
      ),
    );
  }
}
