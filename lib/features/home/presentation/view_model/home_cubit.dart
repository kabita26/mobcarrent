import 'package:bloc/bloc.dart';
import '../../domain/entities/car.dart';
import '../../domain/use_case/get_car_listings.dart';

class HomeState {
  final List<Car> cars;
  final bool isLoading;
  final String error;

  HomeState({
    required this.cars,
    required this.isLoading,
    required this.error,
  });

  factory HomeState.initial() {
    return HomeState(cars: [], isLoading: false, error: '');
  }

  HomeState copyWith({List<Car>? cars, bool? isLoading, String? error}) {
    return HomeState(
      cars: cars ?? this.cars,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  final GetCarListings getCarListings;

  HomeCubit(this.getCarListings) : super(HomeState.initial());

  Future<void> fetchCars() async {
    emit(state.copyWith(isLoading: true));
    try {
      final cars = await getCarListings();
      print("Fetched ${cars.length} cars");
      emit(state.copyWith(cars: cars, isLoading: false));
    } catch (e) {
      print("Error fetching cars: $e");
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
