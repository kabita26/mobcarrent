import 'package:bloc/bloc.dart';
import 'package:car_rent/features/home/domain/entity/car.dart';

class SearchState {
  final List<Car> results;
  final bool isLoading;
  final String error;

  SearchState({
    required this.results,
    required this.isLoading,
    required this.error,
  });

  factory SearchState.initial() {
    return SearchState(results: [], isLoading: false, error: '');
  }

  SearchState copyWith({List<Car>? results, bool? isLoading, String? error}) {
    return SearchState(
      results: results ?? this.results,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class SearchCubit extends Cubit<SearchState> {
  final List<Car> allCars; // Store fetched cars from HomeCubit

  SearchCubit(this.allCars) : super(SearchState.initial());

  void search(String query) {
    emit(state.copyWith(isLoading: true));

    try {
      final filteredResults = allCars
          .where((car) =>
              car.brand.toLowerCase().contains(query.toLowerCase()) ||
              car.model.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(state.copyWith(results: filteredResults, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
