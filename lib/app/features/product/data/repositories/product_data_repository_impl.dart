import 'package:my_project/app/core/exceptions/exception.dart';
import 'package:my_project/app/features/product/data/models/product_model.dart';
import 'package:my_project/app/core/exceptions/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_project/app/features/product/data/sources/product_data_remote.dart';
import 'package:my_project/app/features/product/domain/entities/insert_product_entity.dart';
import 'package:my_project/app/features/product/domain/entities/product_entity.dart';
import 'package:my_project/app/features/product/domain/repositories/product_data_repository.dart';

import '../models/insert_product_model.dart';

typedef _ProductData = Future<List<ProductModel>> Function();
typedef _InsertProduct = Future<InsertProductModel> Function();

class ProductDataRepositoryImpl implements ProductDataRepository {
  final ProductDataSourceRemote remoteDataSource;

  ProductDataRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProduct() async {
    return await _getAllProduct(() => remoteDataSource.getAllData());
  }

  Future<Either<Failure, List<ProductEntity>>> _getAllProduct(
      _ProductData getAllProductData) async {
    try {
      final product = await getAllProductData();
      return Right(product);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, InsertProductEntity>> insertData() async {
    return _insertProduct(() => remoteDataSource.insertProduct());
  }

  Future<Either<Failure, InsertProductEntity>> _insertProduct(
      _InsertProduct insertProduct) async {
    try {
      final product = await insertProduct();
      return Right(product);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
