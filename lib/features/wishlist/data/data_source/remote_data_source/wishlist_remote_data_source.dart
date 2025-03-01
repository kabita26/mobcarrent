import 'package:car_rent/app/constants/api_end_point.dart';
import 'package:car_rent/features/wishlist/data/model/wishlist_api_model.dart';
import 'package:dio/dio.dart';

abstract class IWishlistDataSource {
  Future<List<WishlistApiModel>> getWishlist(String userId);
  Future<void> addToWishlist(WishlistApiModel wishlist);
  Future<void> removeFromWishlist(String id);
}

class WishlistRemoteDataSource implements IWishlistDataSource {
  final Dio _dio;

  WishlistRemoteDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<List<WishlistApiModel>> getWishlist(String userId) async {
    final response = await _dio.get('${ApiEndpoints.getWishlist}$userId');
    return (response.data as List).map((item) => WishlistApiModel.fromJson(item)).toList();
  }

  @override
  Future<void> addToWishlist(WishlistApiModel wishlist) async {
    await _dio.post(ApiEndpoints.addWishlist, data: wishlist.toJson());
  }

  @override
  Future<void> removeFromWishlist(String id) async {
    await _dio.delete('${ApiEndpoints.removeWishlist}$id');
  }
}
