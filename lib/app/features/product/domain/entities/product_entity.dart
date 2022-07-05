import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final int price;
  final int quantity;

  const ProductEntity({
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        name,
        price,
        quantity,
      ];
}
