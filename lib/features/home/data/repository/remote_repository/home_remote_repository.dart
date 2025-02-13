// import 'package:car_rent/features/home/data/data_source/remote_datasource/home_remote_datasource.dart';
// import 'package:car_rent/features/home/data/model/home_api_model.dart';
// import 'package:car_rent/features/home/data/model/home_model.dart';

// class HomeRemoteRepository {
//   final HomeRemoteDataSource _remoteDataSource;

//   HomeRemoteRepository(this._remoteDataSource);

//   /// Fetch all car listings from the API
//   Future<List<Car>> getCarListings() async {
//     List<CarApiModel> apiCars = await _remoteDataSource.getCarListings();

//     return apiCars.map((car) => Car(
//       id: car.id,
//       name: car.name,
//       brand: car.brand,
//       model: car.model,
//       year: car.year,
//       fuelType: car.fuelType,
//       carManufacturer: car.carManufacturer,
//       description: car.description,
//       address: car.address,
//       price: car.price,
//       discountPrice: car.discountPrice,
//       offer: car.offer,
//       parking: car.parking,
//       type: car.type,
//       driveType: car.driveType,
//       seatingCapacity: car.seatingCapacity,
//       imageUrls: car.imageUrls,
//     )).toList();
//   }

//   /// Fetch a single car by its ID
//   Future<Car> getCarById(String carId) async {
//     CarApiModel apiCar = await _remoteDataSource.getCarById(carId);
//     return Car(
//       id: apiCar.id,
//       name: apiCar.name,
//       brand: apiCar.brand,
//       model: apiCar.model,
//       year: apiCar.year,
//       fuelType: apiCar.fuelType,
//       carManufacturer: apiCar.carManufacturer,
//       description: apiCar.description,
//       address: apiCar.address,
//       price: apiCar.price,
//       discountPrice: apiCar.discountPrice,
//       offer: apiCar.offer,
//       parking: apiCar.parking,
//       type: apiCar.type,
//       driveType: apiCar.driveType,
//       seatingCapacity: apiCar.seatingCapacity,
//       imageUrls: apiCar.imageUrls,
//     );
//   }

//   /// Search for cars based on query parameters (brand, type, price range, etc.)
//   Future<List<Car>> searchCars(String query) async {
//     List<CarApiModel> searchResults = await _remoteDataSource.searchCars(query);

//     return searchResults.map((car) => Car(
//       id: car.id,
//       name: car.name,
//       brand: car.brand,
//       model: car.model,
//       year: car.year,
//       fuelType: car.fuelType,
//       carManufacturer: car.carManufacturer,
//       description: car.description,
//       address: car.address,
//       price: car.price,
//       discountPrice: car.discountPrice,
//       offer: car.offer,
//       parking: car.parking,
//       type: car.type,
//       driveType: car.driveType,
//       seatingCapacity: car.seatingCapacity,
//       imageUrls: car.imageUrls,
//     )).toList();
//   }
// }
