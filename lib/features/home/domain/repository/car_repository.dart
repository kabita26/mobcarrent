
import 'package:car_rent/features/home/domain/entity/car.dart';

abstract class CarRepository {
  Future<List<Car>> getCarListings();
  Future<List<Car>> getWishlist();
  Future<List<Car>> getBookings();
  Future<List<Car>> searchCars(String query);
}
