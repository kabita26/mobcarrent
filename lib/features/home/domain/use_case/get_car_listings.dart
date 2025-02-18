
import 'package:car_rent/features/home/domain/entity/car.dart';
import 'package:car_rent/features/home/domain/repository/car_repository.dart';

class GetCarListings {
  final CarRepository repository;
  GetCarListings(this.repository);

  Future<List<Car>> call() async {
    return repository.getCarListings();
  }
}
