import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/routes.dart';
import '../../../../utils/custom_loading.dart';
import '../../data/models/delete_product_model.dart';
import '../../domain/entities/product_entity.dart';
import '../providers/products_provider.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final productProvider = context.read<ProductProvider>();
    return ListTile(
      title: Text(product.name),
      onTap: () {
        productProvider.setSelectProduct = product;
        Navigator.pushNamed(
          context,
          MyRoute.actionProduct,
          arguments: {
            "title": "Edit Product",
          },
        );
      },
      trailing: IconButton(
        splashRadius: 25,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const MyCustomLoading(),
          );
          context
              .read<ProductProvider>()
              .deleteProduct(
                DeleteProductModel(
                  productId: product.id,
                  userId: "fc8445b1-9a74-4416-969c-2c69e5dc5686",
                ),
              )
              .whenComplete(
                () => Navigator.pop(context),
              );
        },
        icon: const Icon(
          Icons.delete,
        ),
      ),
    );
  }
}
