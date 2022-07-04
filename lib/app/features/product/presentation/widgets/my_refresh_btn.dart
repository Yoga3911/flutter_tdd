import 'package:flutter/material.dart';

class MyRefreshBtn extends StatelessWidget {
  const MyRefreshBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.refresh_outlined),
      splashRadius: 20,
    );
  }
}
