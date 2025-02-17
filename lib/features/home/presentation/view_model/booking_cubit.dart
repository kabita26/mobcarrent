import 'package:bloc/bloc.dart';
import '../../domain/use_case/get_bookings.dart';

class BookingState {
  final List<Car> bookings;
  final bool isLoading;
  final String error;

  BookingState({
    required this.bookings,
    required this.isLoading,
    required this.error,
  });

  factory BookingState.initial() {
    return BookingState(bookings: [], isLoading: false, error: '');
  }

  BookingState copyWith({List<Car>? bookings, bool? isLoading, String? error}) {
    return BookingState(
      bookings: bookings ?? this.bookings,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class BookingCubit extends Cubit<BookingState> {
  final GetBookings getBookings;

  BookingCubit(this.getBookings) : super(BookingState.initial());

  Future<void> fetchBookings() async {
    emit(state.copyWith(isLoading: true));
    try {
      final bookings = await getBookings();
      emit(state.copyWith(bookings: bookings, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
