import 'package:dartz/dartz.dart';
import 'package:my_project/app/features/product/data/models/insert_product_model.dart';
import 'package:my_project/app/features/product/data/models/product_model.dart';
import 'package:my_project/app/features/product/domain/entities/product_entity.dart';

import '../../../../core/exceptions/failures.dart';
import '../entities/insert_product_entity.dart';

abstract class ProductDataRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProduct();
  Future<Either<Failure, InsertProductEntity>> insertData(InsertProductModel insertProductModel);
}
