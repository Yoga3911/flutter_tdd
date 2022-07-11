import 'package:flutter/material.dart';
import 'package:my_project/app/features/product/data/models/delete_product_model.dart';
import 'package:my_project/app/features/product/domain/entities/product_entity.dart';
import 'package:my_project/app/features/product/presentation/providers/products_provider.dart';
import 'package:provider/provider.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      trailing: IconButton(
        splashRadius: 25,
        onPressed: () {
          context.read<ProductProvider>().deleteProduct(
                DeleteProductModel(
                  productId: product.id,
                  userId: "fc8445b1-9a74-4416-969c-2c69e5dc5686",
                ),
              );
        },
        icon: const Icon(
          Icons.delete,
        ),
      ),
    );
  }
}
