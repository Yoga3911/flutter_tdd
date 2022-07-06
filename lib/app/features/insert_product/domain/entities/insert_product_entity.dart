import 'package:equatable/equatable.dart';

class InsertProductEntity extends Equatable {
  final String productName;
  final int price;
  final int quantity;
  final String description;

  const InsertProductEntity({
    required this.productName,
    required this.price,
    required this.quantity,
    required this.description,
  });

  @override
  List<Object?> get props => [
        productName,
        price,
        quantity,
        description,
      ];
}
