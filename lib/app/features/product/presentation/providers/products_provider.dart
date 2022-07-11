import 'package:dartz/dartz.dart';
import 'package:my_project/app/core/routes/routes_import.dart';
import 'package:my_project/app/features/product/data/models/delete_product_model.dart';
import 'package:my_project/app/features/product/data/models/insert_product_model.dart';
import 'package:my_project/app/features/product/data/models/product_model.dart';
import 'package:my_project/app/features/product/domain/entities/insert_product_entity.dart';
import 'package:my_project/app/features/product/domain/entities/product_entity.dart';
import 'package:my_project/app/features/product/domain/usecases/delete_product_data_usecase.dart';
import 'package:my_project/app/features/product/domain/usecases/insert_product_usecase.dart';

import '../../../../../injection.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_product_data_usecase.dart';

class ProductProvider with ChangeNotifier {
  late GetProductDataUseCase getProduct;
  late InsertProductUseCase addProduct;
  late DeleteDataUseCase removeProduct;

  ProductProvider() {
    getProduct = getIt.get<GetProductDataUseCase>();
    addProduct = getIt.get<InsertProductUseCase>();
    removeProduct = getIt.get<DeleteDataUseCase>();
  }

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

  Future<dynamic> deleteProduct(DeleteProductModel deleteProductModel) async {
    deleteProductData = deleteProductModel.productId;
    final data =
        await removeProduct.call(deleteProductModel) as Right<Failure, dynamic>;

    return data.value;
  }
}
