
import 'package:car_rent/features/home/domain/entity/car.dart';
import 'package:car_rent/features/home/domain/repository/car_repository.dart';

class GetBookings {
  final CarRepository repository;
  GetBookings(this.repository);

  Future<List<Car>> call() async {
    return repository.getBookings();
  }
}
