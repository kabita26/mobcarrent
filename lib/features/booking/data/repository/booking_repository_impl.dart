import 'package:dartz/dartz.dart';
import '../../domain/entity/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';
import '../data_source/booking_remote_datasource.dart';
import '../dto/booking_dto.dart';

/// Implementation of the Booking Repository.
/// Connects the domain layer with the data layer (API calls).
class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepositoryImpl(this.remoteDataSource);

  /// Fetch all bookings from the remote data source.
  @override
  Future<Either<String, List<BookingEntity>>> getAllBookings() async {
    try {
      final List<BookingDTO> dtoList = await remoteDataSource.getAllBookings();
      final List<BookingEntity> entityList =
          dtoList.map((dto) => dto.toEntity()).toList();
      return Right(entityList);
    } catch (e) {
      return Left("Failed to fetch bookings: ${e.toString()}");
    }
  }

  /// Create a new booking by sending data to the remote data source.
  @override
  Future<Either<String, void>> createBooking(BookingEntity booking) async {
    try {
      final BookingDTO dto = BookingDTO(
        id: booking.id,
        name: booking.name,
        model: booking.model,
        pickupLocation: booking.pickupLocation,
        dropoffLocation: booking.dropoffLocation,
        pickupTime: booking.pickupTime,
        dropoffTime: booking.dropoffTime,
      );

      await remoteDataSource.createBooking(dto);
      return Right(null);
    } catch (e) {
      return Left("Failed to create booking: ${e.toString()}");
    }
  }

  /// Update an existing booking by sending data to the remote data source.
  @override
  Future<Either<String, void>> updateBooking(BookingEntity booking) async {
    try {
      final BookingDTO dto = BookingDTO(
        id: booking.id,
        name: booking.name,
        model: booking.model,
        pickupLocation: booking.pickupLocation,
        dropoffLocation: booking.dropoffLocation,
        pickupTime: booking.pickupTime,
        dropoffTime: booking.dropoffTime,
      );

      await remoteDataSource.updateBooking(dto);
      return Right(null);
    } catch (e) {
      return Left("Failed to update booking: ${e.toString()}");
    }
  }

  /// Delete a booking by sending the booking ID to the remote data source.
  @override
  Future<Either<String, void>> deleteBooking(String bookingId) async {
    try {
      await remoteDataSource.deleteBooking(bookingId);
      return Right(null);
    } catch (e) {
      return Left("Failed to delete booking: ${e.toString()}");
    }
  }
}
