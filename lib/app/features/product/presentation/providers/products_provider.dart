import 'package:dartz/dartz.dart';
import 'package:my_project/app/core/routes/routes_import.dart';
import 'package:my_project/app/features/product/data/models/insert_product_model.dart';
import 'package:my_project/app/features/product/domain/entities/insert_product_entity.dart';
import 'package:my_project/app/features/product/domain/entities/product_entity.dart';
import 'package:my_project/app/features/product/domain/usecases/insert_product_usecase.dart';

import '../../../../../injection.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/product_model.dart';
import '../../domain/usecases/get_product_data_usecase.dart';

class ProductProvider with ChangeNotifier {
  late GetProductDataUseCase getProduct;
  late InsertProductUseCase addProduct;

  ProductProvider() {
    getProduct = getIt.get<GetProductDataUseCase>();
    addProduct = getIt.get<InsertProductUseCase>();
  }

  Future<List<ProductEntity>> getAllProduct() async {
    final data = await getProduct.call(const Params(number: 0))
        as Right<Failure, List<ProductEntity>>;
    return data.value;
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
    final data = await addProduct.call(insertData)
        as Right<Failure, InsertProductEntity>;
    return data.value;
  }
}
