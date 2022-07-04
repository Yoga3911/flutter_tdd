import 'package:flutter/material.dart';
import 'package:my_project/app/features/product/data/models/product_model.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
    );
  }
}
