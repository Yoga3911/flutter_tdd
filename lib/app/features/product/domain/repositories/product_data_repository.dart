import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../data/models/insert_product_model.dart';
import '../../data/models/delete_product_model.dart';
import '../../domain/entities/product_entity.dart';
import '../entities/insert_product_entity.dart';

abstract class ProductDataRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProduct();
  Future<Either<Failure, InsertProductEntity>> insertData(
      InsertProductModel insertProductModel);
  Future<Either<Failure, dynamic>> deleteData(
      DeleteProductModel deleteProductModel);
}
