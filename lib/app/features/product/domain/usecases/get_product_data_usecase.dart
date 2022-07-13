import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../features/product/domain/entities/product_entity.dart';
import '../../../../features/product/domain/repositories/product_data_repository.dart';

class GetProductDataUseCase implements UseCase<List<ProductEntity>, Params> {
  final ProductDataRepository repository;

  const GetProductDataUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(Params _) async {
    return await repository.getAllProduct();
  }
}
