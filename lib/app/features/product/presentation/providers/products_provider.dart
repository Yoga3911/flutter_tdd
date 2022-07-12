import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';

import 'provider_import.dart';

class ProductProvider with ChangeNotifier {
  late GetProductDataUseCase getProduct;
  late InsertProductUseCase addProduct;
  late DeleteDataUseCase removeProduct;

  static final ProductProvider _single = ProductProvider._();

  ProductProvider._() {
    getProduct = getIt.get<GetProductDataUseCase>();
    addProduct = getIt.get<InsertProductUseCase>();
    removeProduct = getIt.get<DeleteDataUseCase>();
  }

  factory ProductProvider() => _single;

  ProductEntity? _selectProduct;
  set setSelectProduct(ProductEntity productEntity) =>
      _selectProduct = productEntity;
  ProductEntity get getSelectProduct => _selectProduct!;

  List<ProductEntity> _productData = [];
  set setProductData(List<ProductEntity> data) {
    _productData = data;
    notifyListeners();
  }

  set insertProductData(ProductEntity data) {
    _productData.add(data);
    notifyListeners();
  }

  set deleteProductData(String productId) {
    _productData.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  List<ProductEntity> get getProductData => _productData;

  Future<void> getAllProduct() async {
    final data = await getProduct.call(const Params(number: 0))
        as Right<Failure, List<ProductEntity>>;
    setProductData = data.value;
  }

  Future<InsertProductEntity> insertProduct({
    required String productName,
    required int price,
    required int quantity,
    required String description,
  }) async {
    final insertData = InsertProductModel(
      productName: productName,
      price: price,
      quantity: quantity,
      description: description,
    );
    insertProductData = ProductModel(
      id: "",
      name: productName,
      price: price,
      quantity: quantity,
    );
    final data = await addProduct.call(insertData)
        as Right<Failure, InsertProductEntity>;
    return data.value;
  }

  Future<void> deleteProduct(DeleteProductModel deleteProductModel) async {
    await removeProduct.call(deleteProductModel) as Right<Failure, dynamic>;
    deleteProductData = deleteProductModel.productId;
  }
}
