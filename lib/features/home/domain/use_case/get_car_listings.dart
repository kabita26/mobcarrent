import '../entities/car.dart';
import '../repositories/car_repository.dart';

class GetCarListings {
  final CarRepository repository;
  GetCarListings(this.repository);

  Future<List<Car>> call() async {
    return repository.getCarListings();
  }
}
