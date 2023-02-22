import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/applink.dart';
import 'package:flutter/material.dart';

class CartProductSection extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String amount;
  const CartProductSection(
      {super.key,
      required this.title,
      required this.image,
      required this.price,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: '${AppLink.productImage}/$image',
        height: 70,
        width: 70,
      ),
      title: Text(title),
      subtitle: Text('Price $price\$'),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              amount,
            ),
          ),
          Expanded(
              flex: 1,
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove)))
        ],
      ),
    );
  }
}
