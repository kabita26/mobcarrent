// import 'package:car_rent/features/home/data/data_source/localdatasource/home_local_datasource.dart';
// import 'package:car_rent/features/home/data/model/home_hive_model.dart';
// import 'package:car_rent/features/home/data/model/home_model.dart';

// class HomeLocalRepository {
//   final HomeLocalDataSource _localDataSource;

//   HomeLocalRepository(this._localDataSource);

//   /// Fetch all saved cars from local storage
//   Future<List<Car>> getCarListings() async {
//     List<HomeHiveModel> hiveCars = await _localDataSource.getCarListings();
    
//     return hiveCars.map((car) => Car(
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

//   /// Save cars to local storage
//   Future<void> saveCarListings(List<Car> cars) async {
//     List<HomeHiveModel> hiveCars = cars.map((car) => HomeHiveModel(
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

//     await _localDataSource.saveCarListings(hiveCars);
//   }

//   /// Fetch a single car by ID
//   Future<Car?> getCarById(String carId) async {
//     HomeHiveModel? hiveCar = await _localDataSource.getCarById(carId);
    
//     if (hiveCar != null) {
//       return Car(
//         id: hiveCar.id,
//         name: hiveCar.name,
//         brand: hiveCar.brand,
//         model: hiveCar.model,
//         year: hiveCar.year,
//         fuelType: hiveCar.fuelType,
//         carManufacturer: hiveCar.carManufacturer,
//         description: hiveCar.description,
//         address: hiveCar.address,
//         price: hiveCar.price,
//         discountPrice: hiveCar.discountPrice,
//         offer: hiveCar.offer,
//         parking: hiveCar.parking,
//         type: hiveCar.type,
//         driveType: hiveCar.driveType,
//         seatingCapacity: hiveCar.seatingCapacity,
//         imageUrls: hiveCar.imageUrls,
//       );
//     }
//     return null;
//   }

//   /// Clear all saved car listings
//   Future<void> clearCarListings() async {
//     await _localDataSource.clearCarListings();
//   }
// }
