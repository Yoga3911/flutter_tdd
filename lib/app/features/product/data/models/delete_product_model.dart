import '../../domain/entities/delete_product_entity.dart';

class DeleteProductModel extends DeleteProductEntity {
  const DeleteProductModel({
    required super.productId,
    required super.userId,
  });

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "user_id": userId,
      };
}
