// import 'package:car_rent/features/home/data/data_source/local_data_source/home_local_datasource.dart';
// import 'package:hive/hive.dart';

// class HomeLocalDataSource {
//   static const String _carBoxName = "car_box";

//   /// Open Hive Box
//   Future<Box<LocalCar>> _openBox() async {
//     return await Hive.openBox<LocalCar>(_carBoxName);
//   }

//   /// Save car listings to local storage
//   Future<void> saveCarListings(List<LocalCar> cars) async {
//     final box = await _openBox();
//     await box.clear(); // Clear old data
//     for (var car in cars) {
//       await box.put(car.id, car);
//     }
//   }

//   /// Get all car listings from local storage
//   Future<List<LocalCar>> getCarListings() async {
//     final box = await _openBox();
//     return box.values.toList();
//   }
// }
