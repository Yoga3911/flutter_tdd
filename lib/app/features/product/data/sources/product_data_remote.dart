import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/constants/endpoint.dart';
import '../models/product_model.dart';

abstract class ProductDataSourceRemote {
  Future<List<Product>> getAllData();
}

class ProductDataSourceRemoteImpl implements ProductDataSourceRemote {
  final Dio dio;
  ProductDataSourceRemoteImpl({required this.dio});

  @override
  Future<List<Product>> getAllData() =>
      _getAllData(ApiURL.baseUrl + ApiURL.getAllProduct);

  Future<List<Product>> _getAllData(String path) async {
    try {
      const header = {'Content-Type': 'application/json'};

      final response = await dio.get(path, options: Options(headers: header));
      if (response.statusCode == 200) {
        List<Product> productData = [];

        for (var element in (response.data["data"] as List<dynamic>)) {
          productData.add(Product.fromJson(element));
        }

        return productData;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }

    return [];
  }
}
