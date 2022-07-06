import 'package:flutter/material.dart';
import 'package:my_project/app/core/constants/color.dart';
import 'package:my_project/app/features/product/presentation/providers/products_provider.dart';
import 'package:provider/provider.dart';

import 'my_list_tile.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = context.read<ProductProvider>();
    return FutureBuilder<void>(
      future: productProvider.getAllProduct(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: MyColor.red,
            ),
          );
        }

        final data = productProvider.getProductData;

        if (data.isEmpty) {
          return const Center(
            child: Text(
              "Tidak ada data",
            ),
          );
        }

        return Consumer<ProductProvider>(
          builder: (_, notifier, __) => ListView.builder(
            itemCount: notifier.getProductData.length,
            itemBuilder: (_, index) {
              return MyListTile(product: notifier.getProductData[index]);
            },
          ),
        );
      },
    );
  }
}
