import 'package:car_rent/features/wishlist/domain/entity/wishlist_car.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_api_model.g.dart';

@JsonSerializable()
class WishlistApiModel extends WishlistEntity {
  const WishlistApiModel({
    required String id,
    required String userId,
    required String carId,
    required String name,
    required String brand,
    required double regularPrice,
    required String imageURL,
  }) : super(
          id: id,
          userId: userId,
          carId: carId,
          name: name,
          brand: brand,
          regularPrice: regularPrice,
          imageURL: imageURL,
        );

  factory WishlistApiModel.fromJson(Map<String, dynamic> json) => _$WishlistApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$WishlistApiModelToJson(this);
}
