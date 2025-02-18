
import 'package:car_rent/features/home/domain/entity/car.dart';
import 'package:car_rent/features/home/domain/repository/car_repository.dart';

class GetWishlist {
  final CarRepository repository;
  GetWishlist(this.repository);

  Future<List<Car>> call() async {
    return repository.getWishlist();
  }
}
