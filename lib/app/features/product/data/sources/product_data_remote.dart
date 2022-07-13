import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/constants/endpoint.dart';
import '../../data/models/delete_product_model.dart';
import '../../data/models/insert_product_model.dart';
import '../models/product_model.dart';

abstract class ProductDataSourceRemote {
  Future<List<ProductModel>> getAllData();
  Future<InsertProductModel> insertProduct(
      InsertProductModel insertProductModel);
  Future<dynamic> deleteProduct(DeleteProductModel deleteProductModel);
}

class ProductDataSourceRemoteImpl implements ProductDataSourceRemote {
  final Dio dio;
  const ProductDataSourceRemoteImpl({required this.dio});

  //! GET ALL PRODUCT
  @override
  Future<List<ProductModel>> getAllData() =>
      _getAllData(ApiURL.baseUrl + ApiURL.product);

  Future<List<ProductModel>> _getAllData(String path) async {
    try {
      const header = {
        'Content-Type': 'application/json',
      };

      final response = await dio.get(path, options: Options(headers: header));
      if (response.statusCode == 200) {
        if (response.data["data"] != null) {
          List<ProductModel> productData = [];

          for (var element in (response.data["data"] as List<dynamic>)) {
            productData.add(ProductModel.fromJson(element));
          }

          return productData;
        }
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }

    return [];
  }

  //! INSERT PRODUCT
  @override
  Future<InsertProductModel> insertProduct(
          InsertProductModel insertProductModel) async =>
      _insertProduct(ApiURL.baseUrl + ApiURL.product, insertProductModel);

  Future<InsertProductModel> _insertProduct(
      String path, InsertProductModel insertProductModel) async {
    try {
      const header = {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImVrbzEyMyIsImVtYWlsIjoiZWtvQGdtYWlsLmNvbSIsImFkZHJlc3MiOiJKbCBLZW5hbmdhIDEyIiwicm9sZV9pZCI6MiwiZXhwIjoxNjU3NzE1ODUzLCJpYXQiOjE2NTc2Mjk0NTMsImlzcyI6Im15cHJvamVjdCJ9.SBsX3mdCwhqoI4vv-kPJYWGRsW26q8lxRqdM0q8paZ4',
      };

      final body = jsonEncode(insertProductModel.toJson());

      final response = await dio.post(
        path,
        options: Options(headers: header),
        data: body,
      );
      if (response.statusCode == 200) {
        log("Insert success!");
        return const InsertProductModel(
          productName: "qwe",
          price: 1,
          quantity: 1,
          description: "asd",
        );
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }

    return const InsertProductModel(
      productName: "",
      price: 0,
      quantity: 0,
      description: "",
    );
  }

  //! DELETE PRODUCT
  @override
  Future<dynamic> deleteProduct(DeleteProductModel deleteProductModel) async =>
      _deleteProduct(ApiURL.baseUrl + ApiURL.product, deleteProductModel);

  Future<dynamic> _deleteProduct(
      String path, DeleteProductModel deleteProductModel) async {
    try {
      const header = {
        "Content-Type": "application/json",
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImVrbzEyMyIsImVtYWlsIjoiZWtvQGdtYWlsLmNvbSIsImFkZHJlc3MiOiJKbCBLZW5hbmdhIDEyIiwicm9sZV9pZCI6MiwiZXhwIjoxNjU3NzE1ODUzLCJpYXQiOjE2NTc2Mjk0NTMsImlzcyI6Im15cHJvamVjdCJ9.SBsX3mdCwhqoI4vv-kPJYWGRsW26q8lxRqdM0q8paZ4',
      };

      final body = jsonEncode(deleteProductModel.toJson());

      final response =
          await dio.delete(path, options: Options(headers: header), data: body);

      if (response.statusCode == 200) {
        log("Delete berhasil");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
