// import 'package:hive/hive.dart';

// part 'home_hive_model.g.dart';

// @HiveType(typeId: 0)
// class HomeHiveModel {
//   @HiveField(0)
//   final String id;

//   @HiveField(1)
//   final String name;

//   @HiveField(2)
//   final String brand;

//   @HiveField(3)
//   final String model;

//   @HiveField(4)
//   final int year;

//   @HiveField(5)
//   final String fuelType;

//   @HiveField(6)
//   final String carManufacturer;

//   @HiveField(7)
//   final String description;

//   @HiveField(8)
//   final String address;

//   @HiveField(9)
//   final double price;

//   @HiveField(10)
//   final double? discountPrice;

//   @HiveField(11)
//   final String? offer;

//   @HiveField(12)
//   final bool parking;

//   @HiveField(13)
//   final String type; // 'rent' or 'sale'

//   @HiveField(14)
//   final String driveType;

//   @HiveField(15)
//   final int seatingCapacity;

//   @HiveField(16)
//   final List<String> imageUrls;

//   HomeHiveModel({
//     required this.id,
//     required this.name,
//     required this.brand,
//     required this.model,
//     required this.year,
//     required this.fuelType,
//     required this.carManufacturer,
//     required this.description,
//     required this.address,
//     required this.price,
//     this.discountPrice,
//     this.offer,
//     required this.parking,
//     required this.type,
//     required this.driveType,
//     required this.seatingCapacity,
//     required this.imageUrls,
//   });

//   /// Convert API JSON response into Hive model
//   factory HomeHiveModel.fromJson(Map<String, dynamic> json) {
//     return HomeHiveModel(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       brand: json['brand'] ?? '',
//       model: json['model'] ?? '',
//       year: json['year'] ?? 0,
//       fuelType: json['fuelType'] ?? '',
//       carManufacturer: json['carManufacturer'] ?? '',
//       description: json['description'] ?? '',
//       address: json['address'] ?? '',
//       price: (json['Price'] ?? 0).toDouble(),
//       discountPrice: json['discountPrice'] != null ? (json['discountPrice'] as num).toDouble() : null,
//       offer: json['offer'],
//       parking: json['parking'] ?? false,
//       type: json['type'] ?? '',
//       driveType: json['driveType'] ?? '',
//       seatingCapacity: json['seatingCapacity'] ?? 0,
//       imageUrls: List<String>.from(json['imageUrls'] ?? []),
//     );
//   }

//   /// Convert Hive model to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'brand': brand,
//       'model': model,
//       'year': year,
//       'fuelType': fuelType,
//       'carManufacturer': carManufacturer,
//       'description': description,
//       'address': address,
//       'Price': price,
//       'discountPrice': discountPrice,
//       'offer': offer,
//       'parking': parking,
//       'type': type,
//       'driveType': driveType,
//       'seatingCapacity': seatingCapacity,
//       'imageUrls': imageUrls,
//     };
//   }
// }
