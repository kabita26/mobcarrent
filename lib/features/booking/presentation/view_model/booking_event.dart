import '../../domain/entity/booking_entity.dart';

abstract class BookingEvent {}

class GetAllBookingsEvent extends BookingEvent {}

class CreateBookingEvent extends BookingEvent {
  final BookingEntity booking;
  CreateBookingEvent(this.booking);
}

class UpdateBookingEvent extends BookingEvent {
  final BookingEntity booking;
  UpdateBookingEvent(this.booking);
}

class DeleteBookingEvent extends BookingEvent {
  final String bookingId;
  DeleteBookingEvent(this.bookingId);
}
