import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/constants/endpoint.dart';
import '../models/product_model.dart';

abstract class ProductDataSourceRemote {
  Future<List<ProductModel>> getAllData();
}

class ProductDataSourceRemoteImpl implements ProductDataSourceRemote {
  final Dio dio;
  ProductDataSourceRemoteImpl({required this.dio});

  @override
  Future<List<ProductModel>> getAllData() =>
      _getAllData(ApiURL.baseUrl + ApiURL.getAllProduct);

  Future<List<ProductModel>> _getAllData(String path) async {
    try {
      const header = {'Content-Type': 'application/json'};

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
}
