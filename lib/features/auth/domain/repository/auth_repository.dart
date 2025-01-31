

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:car_rent/core/error/failure.dart';
import 'package:car_rent/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerUser(AuthEntity user);
  
  Future<Either<Failure, String>> loginUser(
    String email, String password);

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
