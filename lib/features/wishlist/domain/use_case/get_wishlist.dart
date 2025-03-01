
import 'package:car_rent/features/wishlist/domain/entity/wishlist_car.dart';
import 'package:car_rent/features/wishlist/domain/repository/wishlist_repository.dart';

class GetWishlistUseCase {
  final IWishlistRepository repository;

  GetWishlistUseCase(this.repository);

  Future<List<WishlistEntity>> call(String userId) async {
    return await repository.getWishlist(userId);
  }
}
