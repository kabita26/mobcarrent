import 'dart:convert';
import 'package:car_rent/app/constants/api_end_point.dart';
import 'package:http/http.dart' as http;
import '../dto/booking_dto.dart';

/// Abstract class defining the contract for Booking Remote Data Source.
/// This class interacts with the backend API.
abstract class BookingRemoteDataSource {
  /// Fetch all bookings from the backend.
  Future<List<BookingDTO>> getAllBookings();

  /// Creates a new booking.
  Future<void> createBooking(BookingDTO bookingDTO);

  /// Updates an existing booking.
  Future<void> updateBooking(BookingDTO bookingDTO);

  /// Deletes a booking by its ID.
  Future<void> deleteBooking(String bookingId);
}

/// Implementation of the Booking Remote Data Source.
class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final http.Client client;

  BookingRemoteDataSourceImpl(this.client);

  /// Fetch all bookings from the backend API.
  @override
  Future<List<BookingDTO>> getAllBookings() async {
    final response = await client.get(Uri.parse(ApiEndpoints.getAllBookings));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => BookingDTO.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load bookings");
    }
  }

  /// Create a new booking by sending a POST request to the backend API.
  @override
  Future<void> createBooking(BookingDTO bookingDTO) async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.createBooking),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(bookingDTO.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to create booking");
    }
  }

  /// Update an existing booking by sending a PUT request to the backend API.
  @override
  Future<void> updateBooking(BookingDTO bookingDTO) async {
    final response = await client.put(
      Uri.parse("${ApiEndpoints.updateBooking}/${bookingDTO.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(bookingDTO.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update booking");
    }
  }

  /// Delete a booking by sending a DELETE request to the backend API.
  @override
  Future<void> deleteBooking(String bookingId) async {
    final response = await client.delete(
      Uri.parse("${ApiEndpoints.deleteBooking}/$bookingId"),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to delete booking");
    }
  }
}
