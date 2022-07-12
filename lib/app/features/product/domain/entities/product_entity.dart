import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final int price;
  final int quantity;
  final String description;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        quantity,
        description,
      ];
}
