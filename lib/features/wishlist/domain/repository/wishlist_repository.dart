
import 'package:car_rent/features/wishlist/domain/entity/wishlist_car.dart';

abstract class IWishlistRepository {
  Future<List<WishlistEntity>> getWishlist(String userId);
  Future<void> addToWishlist(WishlistEntity wishlist);
  Future<void> removeFromWishlist(String id);
}
