import 'package:flutter/material.dart';

class CartTopAppBar extends StatelessWidget {
  final String title;
  const CartTopAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
       Text(title,),
      ],
    );
  }
}
