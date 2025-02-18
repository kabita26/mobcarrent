
import 'package:car_rent/features/home/domain/entity/car.dart';

class CarModel extends Car {
  CarModel({
    required String id,
    required String name,
    required String brand,
    required String model,
    required int year,
    required double regularPrice,
    required String description,
    required List<String> imageUrls,
  }) : super(
          id: id,
          name: name,
          brand: brand,
          model: model,
          year: year,
          regularPrice: regularPrice,
          description: description,
          imageUrls: imageUrls,
        );

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      year: json['year'] ?? 0,
      regularPrice: (json['regularPrice'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] ?? '',
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
    );
  }
}
