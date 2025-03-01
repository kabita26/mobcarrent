import 'package:dartz/dartz.dart';
import '../entity/booking_entity.dart';
import '../repository/booking_repository.dart';

/// Use case for creating a new booking.
class CreateBookingUseCase {
  final BookingRepository repository;

  CreateBookingUseCase(this.repository);

  Future<Either<String, void>> call(BookingEntity booking) {
    return repository.createBooking(booking);
  }
}
