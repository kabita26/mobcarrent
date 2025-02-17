
import 'package:car_rent/features/home/domain/repository/car_repository.dart';

class GetSearchResults {
  final CarRepository repository;
  GetSearchResults(this.repository);

  Future<List<Car>> call(String query) async {
    return repository.searchCars(query);
  }
}
