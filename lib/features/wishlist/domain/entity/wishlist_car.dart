import 'package:equatable/equatable.dart';

class WishlistEntity extends Equatable {
  final String id;
  final String userId;
  final String carId;
  final String name;
  final String brand;
  final double regularPrice;
  final String imageURL;

  const WishlistEntity({
    required this.id,
    required this.userId,
    required this.carId,
    required this.name,
    required this.brand,
    required this.regularPrice,
    required this.imageURL,
  });

  @override
  List<Object?> get props => [id, userId, carId, name, brand, regularPrice, imageURL];
}
