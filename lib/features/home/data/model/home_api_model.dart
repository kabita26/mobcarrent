// import 'dart:convert';

// class CarApiModel {
//   final String id;
//   final String name;
//   final String brand;
//   final String model;
//   final int year;
//   final String fuelType;
//   final String carManufacturer;
//   final String description;
//   final String address;
//   final double price;
//   final double? discountPrice;
//   final String? offer;
//   final bool parking;
//   final String type; // 'rent' or 'sale'
//   final String driveType;
//   final int seatingCapacity;
//   final List<String> imageUrls;

//   CarApiModel({
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

//   /// Convert API JSON response into a Dart object
//   factory CarApiModel.fromJson(Map<String, dynamic> json) {
//     return CarApiModel(
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

//   /// Convert Dart object into JSON
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

//   /// Convert list of JSON objects into a list of Dart objects
//   static List<CarApiModel> fromJsonList(String jsonString) {
//     final List<dynamic> decoded = json.decode(jsonString);
//     return decoded.map((json) => CarApiModel.fromJson(json)).toList();
//   }
// }
