// part of 'car_bloc.dart';

// class CarState extends Equatable {
//   final bool isLoading;
//   final List<CarEntity> cars;
//   final String? error;

//   const CarState({
//     required this.isLoading,
//     required this.cars,
//     required this.error,
//   });

//   factory CarState.initial() {
//     return CarState(
//       isLoading: false,
//       cars: [],
//       error: null,
//     );
//   }

//   CarState copyWith({
//     bool? isLoading,
//     List<CarEntity>? cars,
//     String? error,
//   }) {
//     return CarState(
//       isLoading: isLoading ?? this.isLoading,
//       cars: cars ?? this.cars,
//       error: error ?? this.error,
//     );
//   }

//   @override
//   List<Object?> get props => [isLoading, cars, error];
// }
