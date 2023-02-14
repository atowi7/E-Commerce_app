import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String disc;
  const CustomCard({super.key, required this.title, required this.disc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          disc,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
