import 'package:equatable/equatable.dart';

class EditProductEntity extends Equatable {
  final String id;
  final String productName;
  final int price;
  final int quantity;
  final String description;

  const EditProductEntity({
    required this.id,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        productName,
        price,
        quantity,
        description,
      ];
}
