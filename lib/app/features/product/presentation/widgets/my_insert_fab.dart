import 'package:flutter/material.dart';
import 'package:my_project/app/core/routes/routes.dart';

class MyInsertFAB extends StatelessWidget {
  const MyInsertFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(
        context,
        MyRoute.insertProduct,
      ),
      child: const Icon(Icons.add_rounded),
    );
  }
}
