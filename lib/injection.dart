import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_project/app/features/product/data/repositories/product_data_repository_impl.dart';
import 'package:my_project/app/features/product/domain/usecases/delete_product_data_usecase.dart';
import 'package:my_project/app/features/product/domain/usecases/get_product_data_usecase.dart';
import 'package:my_project/app/features/product/domain/usecases/insert_product_usecase.dart';

import 'app/features/product/data/sources/product_data_remote.dart';
import 'app/features/product/domain/repositories/product_data_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  //! DIO
  getIt.registerLazySingleton<Dio>(() => Dio());

  //! Data Source
  getIt.registerLazySingleton<ProductDataSourceRemote>(
    () => ProductDataSourceRemoteImpl(
      dio: getIt(),
    ),
  );

  //! Repository
  getIt.registerLazySingleton<ProductDataRepository>(
    () => ProductDataRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  //! Use Case
  getIt.registerLazySingleton(
    () => GetProductDataUseCase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => InsertProductUseCase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => DeleteDataUseCase(
      repository: getIt(),
    ),
  );
}
