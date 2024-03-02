import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/view/widget/home/categorie_section.dart';
import 'package:ecommerce_app/view/widget/home/customcard.dart';
import 'package:ecommerce_app/view/widget/home/customtitile.dart';
import 'package:ecommerce_app/view/widget/home/producthome_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    //  Get.put(FavoriteController());
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            CustomAppbar(
              context: context,
              searchHint: '41'.tr,
              controller: homeController.searchTextController!,
              onChanged: (val) {
                homeController.onChangeSearch(val);
              },
              searchonPressed: () {
                homeController.onSearch();
              },
            ),
            GetBuilder<HomeController>(builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch == false
                    ? ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          CustomCard(
                              title: '${controller.cardTitle}',
                              disc: '${controller.cardDesc}'),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          const CategorieSection(),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          if (controller.topSellingProducts.isNotEmpty)
                            const Custometitle(title: 'Top Selling products'),
                          if (controller.topSellingProducts.isNotEmpty)
                            const SizedBox(
                              height: 5,
                            ),
                          if (controller.topSellingProducts.isNotEmpty)
                            const ProductHomeSection(false),
                          const Custometitle(title: 'All products'),
                          const SizedBox(
                            height: 5,
                          ),
                          const ProductHomeSection(true),
                        ],
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 40),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.searchProducts.length,
                            itemBuilder: (context, i) {
                              return ProductSearchWedget(
                                  productModel: controller.searchProducts[i]);
                            }),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ProductSearchWedget extends GetView<HomeController> {
  final ProductModel productModel;
  const ProductSearchWedget({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToProductDetial(productModel, 'tag_hps'),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.primaryColor),
        ),
        child: Column(
          children: [
            Hero(
              tag: 'tag_hps_${productModel.id}',
              child: CachedNetworkImage(
                imageUrl: '${AppLink.productImage}/${productModel.image}',
                height: 70,
                width: 70,
              ),
            ),
            Text(
              '${productModel.name}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Rating'),
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
              '${productModel.price}\$',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
