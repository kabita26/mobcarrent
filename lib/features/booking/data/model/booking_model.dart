import '../dto/booking_dto.dart';
import '../../domain/entity/booking_entity.dart';

/// Booking Model for internal application use.
/// Extends the Booking Entity.
class BookingModel extends BookingEntity {
  BookingModel({
    required String id,
    required String name,
    required String model,
    required String pickupLocation,
    required String dropoffLocation,
    required DateTime pickupTime,
    required DateTime dropoffTime,
  }) : super(
          id: id,
          name: name,
          model: model,
          pickupLocation: pickupLocation,
          dropoffLocation: dropoffLocation,
          pickupTime: pickupTime,
          dropoffTime: dropoffTime,
        );

  /// Convert BookingDTO to BookingModel.
  factory BookingModel.fromDTO(BookingDTO dto) {
    return BookingModel(
      id: dto.id,
      name: dto.name,
      model: dto.model,
      pickupLocation: dto.pickupLocation,
      dropoffLocation: dto.dropoffLocation,
      pickupTime: dto.pickupTime,
      dropoffTime: dto.dropoffTime,
    );
  }

  /// Convert BookingModel to BookingDTO.
  BookingDTO toDTO() {
    return BookingDTO(
      id: id,
      name: name,
      model: model,
      pickupLocation: pickupLocation,
      dropoffLocation: dropoffLocation,
      pickupTime: pickupTime,
      dropoffTime: dropoffTime,
    );
  }
}
