import 'package:dartz/dartz.dart';
import '../repository/booking_repository.dart';

/// Use case for deleting a booking.
class DeleteBookingUseCase {
  final BookingRepository repository;

  DeleteBookingUseCase(this.repository);

  Future<Either<String, void>> call(String bookingId) {
    return repository.deleteBooking(bookingId);
  }
}
