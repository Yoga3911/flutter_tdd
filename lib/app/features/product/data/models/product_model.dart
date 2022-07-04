import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String name,
    required int price,
    required int quantity,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
