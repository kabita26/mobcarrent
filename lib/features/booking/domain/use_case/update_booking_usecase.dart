import 'package:dartz/dartz.dart';
import '../entity/booking_entity.dart';
import '../repository/booking_repository.dart';

/// Use case for updating an existing booking.
class UpdateBookingUseCase {
  final BookingRepository repository;

  UpdateBookingUseCase(this.repository);

  Future<Either<String, void>> call(BookingEntity booking) {
    return repository.updateBooking(booking);
  }
}
