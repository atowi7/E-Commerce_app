import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class AddressBox extends StatelessWidget {
  final String title;
  final String description;
  final bool active;
  const AddressBox({super.key, required this.title, required this.description,required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: active ? AppColor.blue : AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: active ? AppColor.white : AppColor.black,
            ),
        ),
        subtitle: Text(
          description,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: active ? AppColor.white : AppColor.black,
            ),
        ),
      ),
    );
  }
}
