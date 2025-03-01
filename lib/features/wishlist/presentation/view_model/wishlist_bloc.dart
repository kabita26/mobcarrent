import 'package:car_rent/features/wishlist/domain/use_case/add_wishlist_usecase.dart';
import 'package:car_rent/features/wishlist/domain/use_case/get_wishlist.dart';
import 'package:car_rent/features/wishlist/domain/use_case/remove_wishlist_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final GetWishlistUseCase getWishlistUseCase;
  final AddToWishlistUseCase addToWishlistUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;

  WishlistBloc({
    required this.getWishlistUseCase,
    required this.addToWishlistUseCase,
    required this.removeFromWishlistUseCase,
  }) : super(WishlistInitial()) {
    on<LoadWishlist>((event, emit) async {
      emit(WishlistLoading());
      try {
        final wishlist = await getWishlistUseCase.call(event.userId);
        emit(WishlistLoaded(wishlist));
      } catch (e) {
        emit(WishlistError(e.toString()));
      }
    });

    on<AddToWishlist>((event, emit) async {
      await addToWishlistUseCase.call(event.wishlist);
      final updatedWishlist = await getWishlistUseCase.call(event.wishlist.userId);
      emit(WishlistLoaded(updatedWishlist));
    });

    on<RemoveFromWishlist>((event, emit) async {
      await removeFromWishlistUseCase.call(event.id);
      emit(WishlistLoading());
      final updatedWishlist = await getWishlistUseCase.call(event.id);
      emit(WishlistLoaded(updatedWishlist));
    });
  }
}
