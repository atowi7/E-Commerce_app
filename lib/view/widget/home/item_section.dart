import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:ecommerce_app/data/model/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemSection extends GetView<HomeController> {
  const ItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ItemWidget(
                itemModel: ItemModel.fromJson(controller.items[index]),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.items.length),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final ItemModel itemModel;
  const ItemWidget({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColor.blue,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.black),
          ),
          child: Image.network(
            '${AppLink.itemImage}/${itemModel.image}',
            color: AppColor.white,
          ),
        ),
        Positioned(
          left: 10,
          child: Text(
            '${itemModel.name}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Container(
          color: Colors.black,
        ),
      ],
    );
  }
}
