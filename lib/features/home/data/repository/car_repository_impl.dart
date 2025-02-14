import '../../domain/entities/car.dart';
import '../../domain/repositories/car_repository.dart';
import '../datasource/car_remote_data_source.dart';

class CarRepositoryImpl implements CarRepository {
  final CarRemoteDataSource remoteDataSource;
  CarRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Car>> getCarListings() async {
    return await remoteDataSource.fetchCarListings();
  }

  @override
  Future<List<Car>> getWishlist() async {
    return await remoteDataSource.fetchWishlist();
  }

  @override
  Future<List<Car>> getBookings() async {
    return await remoteDataSource.fetchBookings();
  }

  @override
  Future<List<Car>> searchCars(String query) async {
    return await remoteDataSource.fetchSearchCars(query);
  }
}
