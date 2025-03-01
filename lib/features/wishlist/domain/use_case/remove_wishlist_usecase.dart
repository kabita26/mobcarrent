
import 'package:car_rent/features/wishlist/domain/repository/wishlist_repository.dart';

class RemoveFromWishlistUseCase {
  final IWishlistRepository repository;

  RemoveFromWishlistUseCase(this.repository);

  Future<void> call(String wishlistId) async {
    await repository.removeFromWishlist(wishlistId);
  }
}
