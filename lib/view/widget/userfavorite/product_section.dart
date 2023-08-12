import 'package:ecommerce_app/controller/userfavorite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
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
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ProductWedget(
                userFavoriteModel: controller.datalist[index],
              );
            }),
      );
    });
  }
}

class ProductWedget extends StatelessWidget {
  final UserFavoriteModel userFavoriteModel;
  const ProductWedget({super.key, required this.userFavoriteModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Hero(
            tag: '${userFavoriteModel.proId}',
            child: CachedNetworkImage(
              imageUrl: '${AppLink.productImage}/${userFavoriteModel.proImage}',
              height: 70,
              width: 70,
            ),
          ),
          Text(
            '${userFavoriteModel.proName}',
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
                  children: List.generate(
                      5,
                      (index) => SizedBox(
                            height: 25,
                            width: 25,
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
          Text(
            '${userFavoriteModel.proPrice}\$',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [

          //     GetBuilder<UserFavoriteController>(builder: (controller) {
          //       return IconButton(
          //           onPressed: () {
          //             controller.deletData(userFavoriteModel.favId!);
          //           },
          //           icon: const Icon(Icons.favorite_rounded));
          //     })
          //   ],
          // ),
        ],
      ),
    );
  }
}
