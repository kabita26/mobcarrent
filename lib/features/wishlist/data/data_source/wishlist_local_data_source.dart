import 'package:car_rent/features/wishlist/domain/entity/wishlist_car.dart';

abstract interface class IWishlistDataSource {
  Future<List<WishlistEntity>> getWishlist(String userId);
  Future<void> removeFromWishlist(String id, String? token);
  Future<void> addToWishlist(WishlistEntity wishlist);
}