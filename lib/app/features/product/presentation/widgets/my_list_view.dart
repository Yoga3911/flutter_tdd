import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import '../../data/sources/remote_product.dart';
import 'my_list_tile.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    RemoteProductSourceImpl remoteProductSourceImpl = RemoteProductSourceImpl(dio: Dio());
    return FutureBuilder(
      future: remoteProductSourceImpl.getAllData(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final data = snapshot.data as List<Product>;
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
