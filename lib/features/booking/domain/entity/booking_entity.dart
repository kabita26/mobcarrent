/// Booking Entity: Defines the core structure of a Booking object.
class BookingEntity {
  final String id;
  final String name;
  final String model;
  final String pickupLocation;
  final String dropoffLocation;
  final DateTime pickupTime;
  final DateTime dropoffTime;

  BookingEntity({
    required this.id,
    required this.name,
    required this.model,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupTime,
    required this.dropoffTime,
  });
}
