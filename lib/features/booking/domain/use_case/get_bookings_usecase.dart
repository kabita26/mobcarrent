import 'package:dartz/dartz.dart';
import '../entity/booking_entity.dart';
import '../repository/booking_repository.dart';

/// Use case for fetching all bookings.
class GetBookingsUseCase {
  final BookingRepository repository;

  GetBookingsUseCase(this.repository);

  Future<Either<String, List<BookingEntity>>> call() {
    return repository.getAllBookings();
  }
}
