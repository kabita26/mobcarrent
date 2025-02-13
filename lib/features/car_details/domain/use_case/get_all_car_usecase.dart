// import 'dart:io';

// import 'package:car_rent/app/usecase/usecase.dart';
// import 'package:car_rent/core/error/failure.dart';
// import 'package:car_rent/features/auth/domain/repository/auth_repository.dart';
// import 'package:dartz/dartz.dart';
// class UploadImageParams {
//   final File file;

//   const UploadImageParams({
//     required this.file,
//   });
// }

// class UploadImageUsecase
//     implements UsecaseWithParams<String, UploadImageParams> {
//   final IAuthRepository _repository;

//   UploadImageUsecase(this._repository);

//   @override
//   Future<Either<Failure, String>> call(UploadImageParams params) {
//     return _repository.uploadProfilePicture(params.file);
// }
// }