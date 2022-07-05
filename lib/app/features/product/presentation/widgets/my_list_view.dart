import 'package:flutter/material.dart';
import 'package:my_project/app/features/product/presentation/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../../data/models/product_model.dart';
import 'my_list_tile.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: context.read<ProductProvider>().getAllProduct(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const SizedBox();
        }

        final data = snapshot.data;
        return ListView.builder(
          itemCount: data!.length,
          itemBuilder: (_, index) {
            return MyListTile(product: data[index]);
          },
        );
      },
    );
  }
}
