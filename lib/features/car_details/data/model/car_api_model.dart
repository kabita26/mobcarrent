// import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';
// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'car_api_model.g.dart';

// @JsonSerializable()
// class CarApiModel extends Equatable {
//   @JsonKey(name: '_id')
//   final String? carId;
//   final String carName;
//   final String image;
//   final int capacity;
//   final String fuelType;
//   final List<String> bookedTimeSlots;
//   final double rentPerHour;

//   const CarApiModel({
//     this.carId,
//     required this.carName,
//     required this.image,
//     required this.capacity,
//     required this.fuelType,
//     required this.bookedTimeSlots,
//     required this.rentPerHour,
//   });

//   const CarApiModel.empty()
//       : carId = '',
//         carName = '',
//         image = '',
//         capacity = 0,
//         fuelType = '',
//         bookedTimeSlots = const [],
//         rentPerHour = 0.0;

//   // From JSON (without generator)
//   factory CarApiModel.fromJson(Map<String, dynamic> json) {
//     return CarApiModel(
//       carId: json['_id'],
//       carName: json['carName'],
//       image: json['image'],
//       capacity: json['capacity'],
//       fuelType: json['fuelType'],
//       bookedTimeSlots: List<String>.from(json['bookedTimeSlots'] ?? []),
//       rentPerHour: (json['rentPerHour'] as num).toDouble(),
//     );
//   }

//   // To JSON (without generator)
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': carId,
//       'carName': carName,
//       'image': image,
//       'capacity': capacity,
//       'fuelType': fuelType,
//       'bookedTimeSlots': bookedTimeSlots,
//       'rentPerHour': rentPerHour,
//     };
//   }

//   // Convert API object to entity
//   CarEntity toEntity() {
//     return CarEntity(
//       carId: carId,
//       carName: carName,
//       image: image,
//       capacity: capacity,
//       fuelType: fuelType,
//       bookedTimeSlots: bookedTimeSlots,
//       rentPerHour: rentPerHour,
//     );
//   }

//   // Convert entity to API object
//   factory CarApiModel.fromEntity(CarEntity entity) {
//     return CarApiModel(
//       carId: entity.carId,
//       carName: entity.carName,
//       image: entity.image,
//       capacity: entity.capacity,
//       fuelType: entity.fuelType,
//       bookedTimeSlots: entity.bookedTimeSlots,
//       rentPerHour: entity.rentPerHour,
//     );
//   }

//   // Convert API model list to entity list
//   static List<CarEntity> toEntityList(List<CarApiModel> models) {
//     return models.map((model) => model.toEntity()).toList();
//   }

//   // Convert entity list to API model list
//   static List<CarApiModel> fromEntityList(List<CarEntity> entities) {
//     return entities.map((entity) => CarApiModel.fromEntity(entity)).toList();
//   }

//   @override
//   List<Object?> get props =>
//       [carId, carName, image, capacity, fuelType, bookedTimeSlots, rentPerHour];
// }
