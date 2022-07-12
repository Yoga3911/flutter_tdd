import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';

class MyInsertFAB extends StatelessWidget {
  const MyInsertFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          MyRoute.actionProduct,
          arguments: {"title": "Add Product"}
        );
      },
      child: const Icon(Icons.add_rounded),
    );
  }
}
