import 'package:dartz/dartz.dart';
import 'package:my_project/app/features/product/domain/entities/product_entity.dart';

import '../../../../core/exceptions/failures.dart';

abstract class ProductDataRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProduct();
}
