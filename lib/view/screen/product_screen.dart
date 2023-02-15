import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/item/product_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    return Scaffold(
      body: ListView(
        children: [
          CustomAppbar(
              searchHint: 'Find Product',
              searchonPressed: () {},
              notifyPressed: () {}),
          const ProductSection(),
          GridView.builder(
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, i) {
                return Card(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                          imageUrl: AppLink.itemImage + '/hp.png'),
                      Text('Title'),
                      Text('Desc'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('price'),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.favorite))
                        ],
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
