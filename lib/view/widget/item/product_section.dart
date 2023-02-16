import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ProductSection extends GetView<ProductController> {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ProductWedget(
            productModel: ProductModel.fromJson(controller.products[index]),
          );
        });
  }
}

class ProductWedget extends GetView<ProductController> {
  final ProductModel productModel;
  const ProductWedget({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: '${AppLink.productImage}/${productModel.image}',
            height: 100,
            width: 100,
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
                      5,
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
              Text('${productModel.price}'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
            ],
          ),
        ],
      ),
    );
  }
}
