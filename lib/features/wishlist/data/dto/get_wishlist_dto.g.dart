// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wishlist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWishlistDto _$GetWishlistDtoFromJson(Map<String, dynamic> json) =>
    GetWishlistDto(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => WishlistApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetWishlistDtoToJson(GetWishlistDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
