import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class AmountAndPriceSection extends StatelessWidget {
  final String price;
  final int count;
  final void Function()? onPressedAdd;
  final void Function()? onPressedDelete;
  const AmountAndPriceSection({
    super.key,
    required this.price,
    required this.count,
    required this.onPressedAdd,
    required this.onPressedDelete,
  });

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
                '$count',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 15),
              ),
            ),
            IconButton(
                onPressed: onPressedDelete, icon: const Icon(Icons.remove)),
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
