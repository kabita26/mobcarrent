// import 'package:car_rent/core/network/hive_service.dart';
// import 'package:car_rent/features/car_details/data/data_source/car_data_source.dart';
// import 'package:car_rent/features/car_details/data/model/car_hive_model.dart';
// import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';

// class CarLocalDataSource implements ICarDataSource {
//   final HiveService hiveService;

//   CarLocalDataSource({required this.hiveService});

//   // Get all cars
//   @override
//   Future<List<CarEntity>> getCar() async {
//     try {
//       final carsHiveModels = await hiveService.getAllCares();
//       return carsHiveModels.map((e) => e.toEntity()).toList();
//     } catch (e) {
//       throw Exception('Failed to load cars: $e');
//     }
//   }

//   // Get car by ID
//   Future<CarEntity?> getCarById(String carId) async {
//     try {
//       final carHiveModel = await hiveService.getCarById(carId);
//       if (carHiveModel != null) {
//         return carHiveModel.toEntity();
//       }
//       return null; // If no car is found with the provided ID
//     } catch (e) {
//       throw Exception('Failed to load car with ID $carId: $e');
//     }
//   }
// }
