
import 'package:car_rent/features/wishlist/domain/entity/wishlist_car.dart';
import 'package:car_rent/features/wishlist/domain/repository/wishlist_repository.dart';

class AddToWishlistUseCase {
  final IWishlistRepository repository;

  AddToWishlistUseCase(this.repository);

  Future<void> call(WishlistEntity wishlist) async {
    await repository.addToWishlist(wishlist);
  }
}
