
import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';

abstract interface class ICarDataSource {
  Future<List<CarEntity>> getBatches();
}
