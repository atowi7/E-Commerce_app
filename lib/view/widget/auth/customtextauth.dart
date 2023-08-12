import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextAuth extends StatelessWidget {
  final String t1;
  final String t2;
  final void Function()? onTap;
  const CustomTextAuth({
    super.key,
    required this.t1,
    required this.t2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(t1, style: Theme.of(context).textTheme.displaySmall),
        InkWell(
          onTap: onTap,
          child: Text(t2,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColor.primaryColor)),
        )
      ],
    );
  }
}
