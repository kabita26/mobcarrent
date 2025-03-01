// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistApiModel _$WishlistApiModelFromJson(Map<String, dynamic> json) =>
    WishlistApiModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      carId: json['carId'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      regularPrice: (json['regularPrice'] as num).toDouble(),
      imageURL: json['imageURL'] as String,
    );

Map<String, dynamic> _$WishlistApiModelToJson(WishlistApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'carId': instance.carId,
      'name': instance.name,
      'brand': instance.brand,
      'regularPrice': instance.regularPrice,
      'imageURL': instance.imageURL,
    };
