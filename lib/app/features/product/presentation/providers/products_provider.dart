import 'package:dartz/dartz.dart';
import 'package:my_project/app/core/routes/routes_import.dart';

import '../../../../../injection.dart';
import '../../../../core/exceptions/failures.dart';
import '../../data/models/product_model.dart';
import '../../domain/usecases/get_product_data_usecase.dart';

class ProductProvider with ChangeNotifier {
  late GetProductDataUseCase useCase;

  ProductProvider() {
    useCase = getIt.get<GetProductDataUseCase>();
  }

  Future<List<ProductModel>> getAllProduct() async {
    final data = await useCase.call(const Params(number: 0))
        as Right<Failure, List<ProductModel>>;
    return data.value;
  }
}
