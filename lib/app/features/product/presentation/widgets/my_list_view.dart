import 'package:flutter/material.dart';
import 'package:my_project/app/core/constants/color.dart';
import 'package:my_project/app/features/product/domain/entities/product_entity.dart';
import 'package:my_project/app/features/product/presentation/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../../data/models/product_model.dart';
import 'my_list_tile.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductEntity>>(
      future: context.read<ProductProvider>().getAllProduct(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: MyColor.red,
            ),
          );
        }
        final data = snapshot.data;

        if (data!.isEmpty) {
          return const Center(
            child: Text(
              "Tidak ada data",
            ),
          );
        }

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            return MyListTile(product: data[index]);
          },
        );
      },
    );
  }
}
