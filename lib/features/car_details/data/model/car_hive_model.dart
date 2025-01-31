// import 'package:car_rent/app/constants/hive_table_constant.dart';
// import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';
// import 'package:equatable/equatable.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:uuid/uuid.dart';

// part 'car_hive_model.g.dart';

// @HiveType(typeId: HiveTableConstant.userTableId)
// class CarHiveModel extends Equatable {
//   @HiveField(0)
//   final String? carId;
//   @HiveField(1)
//   final String carName;

//   CarHiveModel({
//     String? carId,
//     required this.carName,
//   }) : carId = carId ?? const Uuid().v4();

//   // Initial Constructor
//   const CarHiveModel.initial()
//       : carId = '',
//         carName = '';

//   // From Entity
//   factory CarHiveModel.fromEntity(CarEntity entity) {
//     return CarHiveModel(
//       carId: entity.carId,
//       carName: entity.carName,
//     );
//   }

//   // To Entity
//   CarEntity toEntity() {
//     return CarEntity(
//       carId: carId,
//       carName: carName,
//     );
//   }

//   // From Entity List
//   static List<CarHiveModel> fromEntityList(List<CarEntity> entityList) {
//     return entityList.map((entity) => CarHiveModel.fromEntity(entity)).toList();
//   }

//   // To Entity List
//   static List<CarEntity> toEntityList(List<CarHiveModel> hiveList) {
//     return hiveList.map((hive) => hive.toEntity()).toList();
//   }

//   @override
//   List<Object?> get props => [carId, carName];
// }
