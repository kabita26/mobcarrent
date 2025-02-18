import 'package:bloc/bloc.dart';
import 'package:car_rent/features/home/domain/entity/car.dart';
import '../../domain/use_case/get_wishlist.dart';

class WishlistState {
  final List<Car> wishlist;
  final bool isLoading;
  final String error;

  WishlistState({
    required this.wishlist,
    required this.isLoading,
    required this.error,
  });

  factory WishlistState.initial() {
    return WishlistState(wishlist: [], isLoading: false, error: '');
  }

  WishlistState copyWith({List<Car>? wishlist, bool? isLoading, String? error}) {
    return WishlistState(
      wishlist: wishlist ?? this.wishlist,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlist getWishlist;

  WishlistCubit(this.getWishlist) : super(WishlistState.initial());

  Future<void> fetchWishlist() async {
    emit(state.copyWith(isLoading: true));
    try {
      final wishlist = await getWishlist();
      emit(state.copyWith(wishlist: wishlist, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
