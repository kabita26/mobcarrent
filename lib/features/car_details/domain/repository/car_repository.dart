import 'package:car_rent/core/error/failure.dart';
import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ICarRepository {
  Future<Either<Failure, List<CarEntity>>> getBatches();
}
