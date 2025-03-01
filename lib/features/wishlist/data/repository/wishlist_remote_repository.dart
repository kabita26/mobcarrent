
import 'package:car_rent/features/wishlist/data/data_source/remote_data_source/wishlist_remote_data_source.dart';
import 'package:car_rent/features/wishlist/data/model/wishlist_api_model.dart';
import 'package:car_rent/features/wishlist/domain/entity/wishlist_car.dart';
import 'package:car_rent/features/wishlist/domain/repository/wishlist_repository.dart';

class WishlistRepositoryImpl implements IWishlistRepository {
  final IWishlistDataSource remoteDataSource;

  WishlistRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<WishlistEntity>> getWishlist(String userId) async {
    return await remoteDataSource.getWishlist(userId);
  }

  @override
  Future<void> addToWishlist(WishlistEntity wishlist) async {
    await remoteDataSource.addToWishlist(WishlistApiModel(
      id: wishlist.id,
      userId: wishlist.userId,
      carId: wishlist.carId,
      name: wishlist.name,
      brand: wishlist.brand,
      regularPrice: wishlist.regularPrice,
      imageURL: wishlist.imageURL,
    ));
  }

  @override
  Future<void> removeFromWishlist(String id) async {
    await remoteDataSource.removeFromWishlist(id);
  }
}
