import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/delete_product_model.dart';
import '../repositories/product_data_repository.dart';

class DeleteDataUseCase implements UseCase<dynamic, DeleteProductModel> {
  final ProductDataRepository repository;

  const DeleteDataUseCase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(DeleteProductModel deleteProductModel) async {
    return await repository.deleteData(deleteProductModel);
  }
}
