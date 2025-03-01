import 'package:dartz/dartz.dart';
import '../entity/booking_entity.dart';

/// Abstract class defining the contract for the Booking Repository.
/// This repository handles interactions between the data and domain layers.
abstract class BookingRepository {
  /// Fetch all bookings from the data source.
  Future<Either<String, List<BookingEntity>>> getAllBookings();

  /// Create a new booking.
  Future<Either<String, void>> createBooking(BookingEntity booking);

  /// Update an existing booking.
  Future<Either<String, void>> updateBooking(BookingEntity booking);

  /// Delete a booking by its ID.
  Future<Either<String, void>> deleteBooking(String bookingId);
}
