import 'package:equatable/equatable.dart';

class DeleteProductEntity extends Equatable {
  final String productId;
  final String userId;

  const DeleteProductEntity({
    required this.productId,
    required this.userId,
  });

  @override
  List<Object?> get props => [
        productId,
        userId,
      ];
}
