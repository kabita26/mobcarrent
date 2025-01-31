// import 'package:car_rent/core/error/failure.dart';
// import 'package:car_rent/features/car_details/data/data_source/car_local_data_source.dart';
// import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';
// import 'package:car_rent/features/car_details/domain/repository/car_repository.dart';
// import 'package:dartz/dartz.dart';

// class CarLocalRepository implements ICarRepository {
//   final CarLocalDataSource _carLocalDataSource;

//   CarLocalRepository({required CarLocalDataSource carLocalDataSource})
//       : _carLocalDataSource = carLocalDataSource;

//   @override
//   Future<Either<Failure, List<CarEntity>>> getCar() async {
//     try {
//       // Fetch cars from the local data source
//       final cars = await _carLocalDataSource.getCares();
//       return Right(cars);
//     } catch (e) {
//       // Return a failure if an exception occurs
//       return Left(LocalDatabaseFailure(message: e.toString()));
//     }
//   }
// }
