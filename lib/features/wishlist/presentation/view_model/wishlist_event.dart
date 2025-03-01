import 'package:car_rent/features/wishlist/domain/entity/wishlist_car.dart';
import 'package:equatable/equatable.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadWishlist extends WishlistEvent {
  final String userId;

  const LoadWishlist(this.userId);

  @override
  List<Object?> get props => [userId];
}

class AddToWishlist extends WishlistEvent {
  final WishlistEntity wishlist;

  const AddToWishlist(this.wishlist);

  @override
  List<Object?> get props => [wishlist];
}

class RemoveFromWishlist extends WishlistEvent {
  final String id;

  const RemoveFromWishlist(this.id);

  @override
  List<Object?> get props => [id];
}
