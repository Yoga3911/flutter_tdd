import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_project/app/constants/endpoint.dart';
import 'package:my_project/app/features/product/data/models/product_model.dart';

abstract class RemoteProductSource {
  Future<dynamic> getAllData();
}

class RemoteProductSourceImpl implements RemoteProductSource {
  final Dio _dio = Dio();

  @override
  Future<dynamic> getAllData() =>
      _getAllData(ApiURL.baseUrl + ApiURL.getAllProduct);

  Future<dynamic> _getAllData(String path) async {
    try {
      final response = await _dio
          .get("https://my-golang-project.herokuapp.com/api/v1/product");
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
  }
}
