import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AmountAndPriceSection extends StatelessWidget {
  final String price;
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;
  const AmountAndPriceSection(
      {super.key,
      required this.price,
      required this.onPressedAdd,
      required this.onPressedRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(onPressed: onPressedAdd, icon: const Icon(Icons.add)),
            Container(
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: AppColor.blue)),
              child: Text(
                '0',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 15),
              ),
            ),
            IconButton(
                onPressed: onPressedRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        Text(
          price,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
