import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/view/widget/cart/cart_bottomappbar.dart';
import 'package:ecommerce_app/view/widget/cart/cart_productsection.dart';
import 'package:ecommerce_app/view/widget/cart/cart_topappbar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CartTopAppBar(
            title: 'Cart',
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('You have 3 products',textAlign: TextAlign.center,),
          const SizedBox(
            height: 10,
          ),
          ...List.generate(
              3,
              (index) => const CartProductSection(
                    title: 'Product',
                    price: '300',
                    image: ImageAssets.logo,
                    amount: '2',
                  )),
        ],
      ),
      bottomNavigationBar: const CartBottomAppBar(
        price: '300',
        shipping: '100',
        total: '400',
      ),
    );
  }
}
