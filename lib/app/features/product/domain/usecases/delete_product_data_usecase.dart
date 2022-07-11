import 'package:my_project/app/core/exceptions/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_project/app/core/usecase/usecase.dart';
import 'package:my_project/app/features/product/data/models/delete_product_model.dart';

import '../repositories/product_data_repository.dart';

class DeleteDataUseCase implements UseCase<dynamic, DeleteProductModel> {
  final ProductDataRepository repository;

  const DeleteDataUseCase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(DeleteProductModel deleteProductModel) async {
    return await repository.deleteData(deleteProductModel);
  }
}
