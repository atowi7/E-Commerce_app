import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: GridView.builder(
            itemCount: controller.products.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ProductWedget(
                productModel: ProductModel.fromJson(controller.products[index]),
              );
            }),
      );
    });
  }
}

class ProductWedget extends GetView<ProductController> {
  final ProductModel productModel;
  const ProductWedget({super.key, required this.productModel});
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${productModel.price}\$'),
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
