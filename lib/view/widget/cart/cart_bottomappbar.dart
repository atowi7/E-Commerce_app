import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CartBottomAppBar extends StatelessWidget {
  final String price;
  final String shipping;
  final String total;
  const CartBottomAppBar(
      {super.key,
      required this.price,
      required this.shipping,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$price\$'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shipping',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$shipping\$'),
            ],
          ),
          const Divider(
            color: AppColor.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$total\$'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Order',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
