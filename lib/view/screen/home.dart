import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/route.dart';
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
    return ListView(
      children: [
        CustomAppbar(
          searchHint: 'Find products',
          controller: homeController.searchTextController!,
          onChanged: (val) {
            homeController.onChangeSearch(val);
          },
          searchonPressed: () {
            homeController.onSearch();
          },
          notifyPressed: () {},
          favPressed: () {
            Get.toNamed(AppRoute.userfavorite);
          },
        ),
        GetBuilder<HomeController>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.isSearch == false
                  ? ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        CustomCard(title: 'Summer Discount', disc: '20%'),
                        CategorieSection(),
                        Custometitle(title: 'Suggestios for products'),
                        ProductHomeSection(),
                      ],
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.searchProducts.length,
                          itemBuilder: (context, i) {
                            return ProductSearchWedget(
                                productModel: controller.searchProducts[i]);
                          }),
                    ));
        }),
      ],
    );
  }
}

class ProductSearchWedget extends GetView<HomeController> {
  final ProductModel productModel;
  const ProductSearchWedget({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToProductDetial(productModel),
      child: Card(
        child: Column(
          children: [
            Hero(
              tag: '${productModel.id}',
              child: CachedNetworkImage(
                imageUrl: '${AppLink.productImage}/${productModel.image}',
                height: 70,
                width: 70,
              ),
            ),
            Text(
              '${productModel.name}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Rating'),
                Row(
                    children: List.generate(
                        3,
                        (index) => IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star),
                              iconSize: 10,
                            )))
              ],
            ),
            Text('${productModel.price}\$'),
          ],
        ),
      ),
    );
  }
}
