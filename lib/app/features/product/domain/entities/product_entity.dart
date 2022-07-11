import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final int price;
  final int quantity;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        quantity,
      ];
}
