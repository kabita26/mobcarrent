import 'package:bloc/bloc.dart';
import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';
import 'package:car_rent/features/car_details/domain/use_case/get_all_car_usecase.dart';
import 'package:equatable/equatable.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetAllCarUseCase _getAllCarUseCase;

  CarBloc({
    required GetAllCarUseCase getAllCarUseCase,
  })  : _getAllCarUseCase = getAllCarUseCase,
        super(CarState.initial()) {
    // Only handle the loading of cars
    on<LoadCars>(_onLoadCars);
    
    // Initially loading the cars when the Bloc is created
    add(LoadCars());
  }

  Future<void> _onLoadCars(LoadCars event, Emitter<CarState> emit) async {
    emit(state.copyWith(isLoading: true));  // Set loading state to true
    final result = await _getAllCarUseCase.call();  // Fetch the cars from use case
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),  // On failure
      (cars) => emit(state.copyWith(isLoading: false, cars: cars)),  // On success
    );
  }
}
