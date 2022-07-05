import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_project/app/core/exceptions/failures.dart';

import '../../data/models/product_model.dart';
import '../../data/repositories/product_data_repository_impl.dart';
import '../../data/sources/product_data_remote.dart';
import 'my_list_tile.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDataRepositoryImpl remoteProductSourceImpl =
        ProductDataRepositoryImpl(
            remoteDataSource: ProductDataSourceRemoteImpl(dio: Dio()));
    return FutureBuilder(
      future: remoteProductSourceImpl.getAllProduct(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final data = (snapshot.data as Right<Failure, List<Product>>).value;
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
