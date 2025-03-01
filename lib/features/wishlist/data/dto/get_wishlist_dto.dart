import 'package:car_rent/features/wishlist/data/model/wishlist_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_wishlist_dto.g.dart';

@JsonSerializable()
class GetWishlistDto {
  final bool success;
  final int count;
  final List<WishlistApiModel> data;

  GetWishlistDto({required this.success, required this.count, required this.data});

  factory GetWishlistDto.fromJson(Map<String, dynamic> json) => _$GetWishlistDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetWishlistDtoToJson(this);
}
