import 'package:car_rent/app/usecase/usecase.dart';
import 'package:car_rent/core/error/failure.dart';
import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';
import 'package:car_rent/features/car_details/domain/repository/car_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCarUseCase implements UsecaseWithoutParams<List<CarEntity>> {
  final ICarRepository batchRepository;

  GetAllCarUseCase({required this.batchRepository});

  @override
  Future<Either<Failure, List<CarEntity>>> call() {
    return batchRepository.getBatches();
  }
}
