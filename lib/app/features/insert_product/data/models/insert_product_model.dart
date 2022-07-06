import 'package:my_project/app/features/insert_product/domain/entities/insert_product_entity.dart';

class InsertProductModel extends InsertProductEntity {
  const InsertProductModel({
    required super.productName,
    required super.price,
    required super.quantity,
    required super.description,
  });
}
