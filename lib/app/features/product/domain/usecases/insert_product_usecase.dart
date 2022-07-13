import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../features/product/data/models/insert_product_model.dart';
import '../../../../features/product/domain/entities/insert_product_entity.dart';
import '../../../../features/product/domain/repositories/product_data_repository.dart';

class InsertProductUseCase
    implements UseCase<InsertProductEntity, InsertProductModel> {
  final ProductDataRepository repository;

  const InsertProductUseCase({required this.repository});

  @override
  Future<Either<Failure, InsertProductEntity>> call(
      InsertProductModel insertProductModel) async {
    return await repository.insertData(insertProductModel);
  }
}
