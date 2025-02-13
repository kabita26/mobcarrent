// import 'package:dio/dio.dart';

// class HomeRemoteDataSource {
//   final Dio _dio;

//   HomeRemoteDataSource(this._dio);

//   /// Fetch car listings from the backend API
//   Future<List<Car>> getCarListings() async {
//     try {
//       Response response = await _dio.get(ApiEndpoints.getCars);

//       if (response.statusCode == 200) {
//         List<dynamic> data = response.data;
//         return data.map((json) => Car.fromJson(json)).toList();
//       } else {
//         throw Exception("Failed to load car listings");
//       }
//     } catch (e) {
//       throw Exception("Error fetching data: $e");
//     }
//   }

//   /// Fetch a specific car by ID
//   Future<Car> getCarById(String carId) async {
//     try {
//       Response response = await _dio.get("${ApiEndpoints.getCarById}/$carId");

//       if (response.statusCode == 200) {
//         return Car.fromJson(response.data);
//       } else {
//         throw Exception("Failed to fetch car details");
//       }
//     } catch (e) {
//       throw Exception("Error fetching car details: $e");
//     }
//   }

//   /// Search for cars based on query parameters (brand, type, price range, etc.)
//   Future<List<Car>> searchCars(String query) async {
//     try {
//       Response response = await _dio.get("${ApiEndpoints.searchCars}?query=$query");

//       if (response.statusCode == 200) {
//         List<dynamic> data = response.data;
//         return data.map((json) => Car.fromJson(json)).toList();
//       } else {
//         throw Exception("No results found");
//       }
//     } catch (e) {
//       throw Exception("Error searching for cars: $e");
//     }
//   }
// }
