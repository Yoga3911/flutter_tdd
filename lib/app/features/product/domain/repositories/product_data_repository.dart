import 'package:dartz/dartz.dart';
import 'package:my_project/app/features/product/data/models/product_model.dart';

import '../../../../core/exceptions/failures.dart';

abstract class ProductDataRepository {
  Future<Either<Failure, List<Product>>> getAllProduct();
}
