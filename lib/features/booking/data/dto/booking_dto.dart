import '../../domain/entity/booking_entity.dart';

/// Data Transfer Object (DTO) for Booking.
/// Used for API communication.
class BookingDTO {
  final String id;
  final String name;
  final String model;
  final String pickupLocation;
  final String dropoffLocation;
  final DateTime pickupTime;
  final DateTime dropoffTime;

  BookingDTO({
    required this.id,
    required this.name,
    required this.model,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupTime,
    required this.dropoffTime,
  });

  /// Convert JSON response to DTO.
  factory BookingDTO.fromJson(Map<String, dynamic> json) {
    return BookingDTO(
      id: json['_id'],
      name: json['name'],
      model: json['model'],
      pickupLocation: json['pickupLocation'],
      dropoffLocation: json['dropoffLocation'],
      pickupTime: DateTime.parse(json['pickupTime']),
      dropoffTime: DateTime.parse(json['dropoffTime']),
    );
  }

  /// Convert DTO to JSON for API requests.
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "model": model,
      "pickupLocation": pickupLocation,
      "dropoffLocation": dropoffLocation,
      "pickupTime": pickupTime.toIso8601String(),
      "dropoffTime": dropoffTime.toIso8601String(),
    };
  }

  /// Convert DTO to Booking Entity.
  BookingEntity toEntity() {
    return BookingEntity(
      id: id,
      name: name,
      model: model,
      pickupLocation: pickupLocation,
      dropoffLocation: dropoffLocation,
      pickupTime: pickupTime,
      dropoffTime: dropoffTime,
    );
  }

  /// Convert Booking Entity to DTO.
  static BookingDTO fromEntity(BookingEntity entity) {
    return BookingDTO(
      id: entity.id,
      name: entity.name,
      model: entity.model,
      pickupLocation: entity.pickupLocation,
      dropoffLocation: entity.dropoffLocation,
      pickupTime: entity.pickupTime,
      dropoffTime: entity.dropoffTime,
    );
  }
}
