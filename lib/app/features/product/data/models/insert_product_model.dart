import '../../domain/entities/insert_product_entity.dart';

class InsertProductModel extends InsertProductEntity {
  const InsertProductModel({
    required super.productName,
    required super.price,
    required super.quantity,
    required super.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": productName,
      "price": price,
      "quantity": quantity,
      "description": description,
      "user_id": "fc8445b1-9a74-4416-969c-2c69e5dc5686",
      "category_id": 2,
    };
  }
}
