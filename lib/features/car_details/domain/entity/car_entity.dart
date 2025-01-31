import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  final String? carId;
  final String carName;
  final String name; // Additional field for name
  final String image; // URL or path to the car image
  final int capacity; // Number of seats or capacity
  final String fuelType; // Fuel type (e.g., petrol, diesel, electric)
  final List<DateTime> bookedTimeSlots; // List of booked time slots
  final double rentPerHour; // Rent per hour

  const CarEntity({
    this.carId,
    required this.carName,
    required this.name,
    required this.image,
    required this.capacity,
    required this.fuelType,
    required this.bookedTimeSlots,
    required this.rentPerHour,
  });

  @override
  List<Object?> get props => [
        carId,
        carName,
        name,
        image,
        capacity,
        fuelType,
        bookedTimeSlots,
        rentPerHour,
      ];
}
