import 'package:flutter/material.dart';
import 'package:my_project/app/features/product/data/models/product_model.dart';
import 'package:my_project/app/features/product/domain/entities/product_entity.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
    );
  }
}
