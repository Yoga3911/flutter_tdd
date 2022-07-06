import 'package:flutter/material.dart';

class MyBackBtn extends StatelessWidget {
  const MyBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_rounded),
      splashRadius: 20,
    );
  }
}
