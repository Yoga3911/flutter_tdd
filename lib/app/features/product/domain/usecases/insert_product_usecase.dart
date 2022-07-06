import 'package:dartz/dartz.dart';
import 'package:my_project/app/core/exceptions/failures.dart';
import 'package:my_project/app/core/usecase/usecase.dart';
import 'package:my_project/app/features/product/data/models/insert_product_model.dart';
import 'package:my_project/app/features/product/domain/entities/insert_product_entity.dart';
import 'package:my_project/app/features/product/domain/repositories/product_data_repository.dart';

class InsertProductUseCase
    implements UseCase<InsertProductEntity, InsertProductModel> {
  final ProductDataRepository repository;

  InsertProductUseCase({required this.repository});

  @override
  Future<Either<Failure, InsertProductEntity>> call(
      InsertProductModel insertProductModel) async {
    return await repository.insertData(insertProductModel);
  }
}
