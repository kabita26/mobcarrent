import '../entities/car.dart';
import '../repositories/car_repository.dart';

class GetWishlist {
  final CarRepository repository;
  GetWishlist(this.repository);

  Future<List<Car>> call() async {
    return repository.getWishlist();
  }
}
