import 'package:flutter/material.dart';

class PopScreen extends StatelessWidget {
  const PopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back_ios),
    );
  }
}
