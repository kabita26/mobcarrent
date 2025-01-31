// import 'package:car_rent/core/error/failure.dart';
// import 'package:car_rent/features/car_details/data/data_source/remote_datasource/car_remote_datasource.dart';
// import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';
// import 'package:car_rent/features/car_details/domain/repository/car_repository.dart';
// import 'package:dartz/dartz.dart';

// class CarRemoteRepository implements ICarRepository {
//   final CarRemoteDataSource remoteDataSource;

//   CarRemoteRepository({required this.remoteDataSource});

//   @override
//   Future<Either<Failure, List<CarEntity>>> getCares() async {
//     try {
//       // Fetch the car data from the remote data source
//       final cars = await remoteDataSource.getCares();
//       return Right(cars);
//     } catch (e) {
//       // Return a failure if an error occurs
//       return Left(
//         ApiFailure(
//           message: e.toString(),
//         ),
//       );
//     }
//   }
// }
