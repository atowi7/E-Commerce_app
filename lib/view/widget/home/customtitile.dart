import 'package:flutter/material.dart';

class Custometitle extends StatelessWidget {
  final String title;
  const Custometitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
