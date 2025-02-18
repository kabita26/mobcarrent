
import 'package:car_rent/app/constants/api_end_point.dart';
import 'package:car_rent/features/home/data/model/car_model.dart';
import 'package:dio/dio.dart';

abstract class CarRemoteDataSource {
  Future<List<CarModel>> fetchCarListings();
  Future<List<CarModel>> fetchWishlist();
  Future<List<CarModel>> fetchBookings();
  Future<List<CarModel>> fetchSearchCars(String query);
}

class CarRemoteDataSourceImpl implements CarRemoteDataSource {
  final Dio dio;
  CarRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CarModel>> fetchCarListings() async {
    final response = await dio.get(ApiEndpoints.carListings);
    if (response.statusCode == 200) {
      final List data = response.data['cars'] as List;
      return data.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load car listings');
    }
  }

  @override
  Future<List<CarModel>> fetchWishlist() async {
    // For demonstration, we assume wishlist uses the same endpoint.
    final response = await dio.get(ApiEndpoints.carListings);
    if (response.statusCode == 200) {
      final List data = response.data['cars'] as List;
      return data.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load wishlist');
    }
  }

  @override
  Future<List<CarModel>> fetchBookings() async {
    // For demonstration, we assume bookings use the same endpoint.
    final response = await dio.get(ApiEndpoints.carListings);
    if (response.statusCode == 200) {
      final List data = response.data['cars'] as List;
      return data.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bookings');
    }
  }

  @override
  Future<List<CarModel>> fetchSearchCars(String query) async {
    final response = await dio.get(
      ApiEndpoints.searchCars,
      queryParameters: {'q': query},
    );
    if (response.statusCode == 200) {
      final List data = response.data['cars'] as List;
      return data.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
