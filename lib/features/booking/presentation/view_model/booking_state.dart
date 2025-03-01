import '../../domain/entity/booking_entity.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final List<BookingEntity> bookings;
  BookingLoaded(this.bookings);
}

class BookingSuccess extends BookingState {}

class BookingError extends BookingState {
  final String message;
  BookingError(this.message);
}
