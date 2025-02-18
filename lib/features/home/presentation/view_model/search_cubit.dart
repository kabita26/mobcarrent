import 'package:bloc/bloc.dart';
import 'package:car_rent/features/home/domain/entity/car.dart';
import '../../domain/use_case/search_cars.dart';

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
  final GetSearchResults getSearchResults;

  SearchCubit(this.getSearchResults) : super(SearchState.initial());

  Future<void> search(String query) async {
    emit(state.copyWith(isLoading: true));
    try {
      final results = await getSearchResults(query);
      emit(state.copyWith(results: results, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
