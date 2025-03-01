import 'package:car_rent/features/booking/domain/use_case/create_booking_usecase.dart';
import 'package:car_rent/features/booking/domain/use_case/delete_booking_usecase.dart';
import 'package:car_rent/features/booking/domain/use_case/get_bookings_usecase.dart';
import 'package:car_rent/features/booking/domain/use_case/update_booking_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/booking_entity.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetBookingsUseCase getBookingsUseCase;
  final CreateBookingUseCase createBookingUseCase;
  final UpdateBookingUseCase updateBookingUseCase;
  final DeleteBookingUseCase deleteBookingUseCase;

  BookingBloc({
    required this.getBookingsUseCase,
    required this.createBookingUseCase,
    required this.updateBookingUseCase,
    required this.deleteBookingUseCase,
  }) : super(BookingInitial()) {
    on<GetAllBookingsEvent>((event, emit) async {
      emit(BookingLoading());
      final result = await getBookingsUseCase.call();
      result.fold(
        (failure) => emit(BookingError(failure)),
        (bookings) => emit(BookingLoaded(bookings)),
      );
    });

    on<CreateBookingEvent>((event, emit) async {
      emit(BookingLoading());
      final result = await createBookingUseCase.call(event.booking);
      result.fold(
        (failure) => emit(BookingError(failure)),
        (_) => emit(BookingSuccess()),
      );
    });

    on<UpdateBookingEvent>((event, emit) async {
      emit(BookingLoading());
      final result = await updateBookingUseCase.call(event.booking);
      result.fold(
        (failure) => emit(BookingError(failure)),
        (_) => emit(BookingSuccess()),
      );
    });

    on<DeleteBookingEvent>((event, emit) async {
      emit(BookingLoading());
      final result = await deleteBookingUseCase.call(event.bookingId);
      result.fold(
        (failure) => emit(BookingError(failure)),
        (_) => emit(BookingSuccess()),
      );
    });
  }
}
