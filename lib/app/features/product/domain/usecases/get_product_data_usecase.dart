import 'package:dartz/dartz.dart';
import 'package:my_project/app/core/exceptions/failures.dart';
import 'package:my_project/app/core/usecase/usecase.dart';
import 'package:my_project/app/features/product/domain/entities/product_entity.dart';
import 'package:my_project/app/features/product/domain/repositories/product_data_repository.dart';

class GetProductDataUseCase implements UseCase<List<ProductEntity>, Params> {
  final ProductDataRepository repository;

  GetProductDataUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(Params _) async {
    return await repository.getAllProduct();
  }
}
