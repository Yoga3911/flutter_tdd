import 'package:my_project/app/features/product/domain/entities/edit_product_entity.dart';

class EditProductModel extends EditProductEntity {
  const EditProductModel({
    required super.id,
    required super.productName,
    required super.price,
    required super.quantity,
    required super.description,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": productName,
        "price": price,
        "quantity": quantity,
        "description": description,
      };
}
