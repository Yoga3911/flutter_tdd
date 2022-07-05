import 'package:my_project/app/core/exceptions/exception.dart';
import 'package:my_project/app/features/product/data/models/product_model.dart';
import 'package:my_project/app/core/exceptions/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_project/app/features/product/data/sources/product_data_remote.dart';
import 'package:my_project/app/features/product/domain/repositories/product_data_repository.dart';

typedef _ProductData = Future<List<ProductModel>> Function();

class ProductDataRepositoryImpl implements ProductDataRepository {
  final ProductDataSourceRemote remoteDataSource;

  ProductDataRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProduct() async {
    return await _getAllProduct(() => remoteDataSource.getAllData());
  }

  Future<Either<Failure, List<ProductModel>>> _getAllProduct(_ProductData getAllProductData) async {
    try {
      final product = await getAllProductData();
      return Right(product);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
