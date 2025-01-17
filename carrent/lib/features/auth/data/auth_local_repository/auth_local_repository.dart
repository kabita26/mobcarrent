import 'dart:io';

import 'package:carrent/core/error/failure.dart';
import 'package:carrent/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:carrent/features/auth/domain/entity/auth_entity.dart';
import 'package:carrent/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

// Repository implementation for managing authentication tasks locally
class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  // Constructor to initialize the data source
  AuthLocalRepository(this._authLocalDataSource);

  // Fetches the current user from local data source
  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      final currentUser = await _authLocalDataSource.getCurrentUser();
      return Right(currentUser); // Successfully returning the user entity
    } catch (e) {
      // Handling errors and returning a failure message
      return Left(LocalDatabaseFailure(
          message: e.toString(), statusCode: 500)); 
    }
  }

  // Logs in the user using email and password from local data source
  @override
  Future<Either<Failure, String>> loginUser(String email, String password) async {
    try {
      final token = await _authLocalDataSource.loginUser(email, password);
      return Right(token); // Successfully returning the token
    } catch (e) {
      // Handling errors and returning a failure message
      return Left(LocalDatabaseFailure(
          message: e.toString(), statusCode: 500)); 
    }
  }

  // Registers a user using the AuthEntity object
  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) async {
    try {
      await _authLocalDataSource.registerUser(user); // Awaiting the registration call
      return Right(null); // Successful registration, no return value
    } catch (e) {
      // Handling errors and returning a failure message
      return Left(LocalDatabaseFailure(
          message: e.toString(), statusCode: 500));
    }
  }

  // Uploads a profile picture, TODO: Implement this functionality
  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      // Placeholder for actual implementation
      // You would replace this with actual logic to upload the profile picture
      // Example: return Right(await _authLocalDataSource.uploadProfilePicture(file));
      throw UnimplementedError("Upload Profile Picture functionality not implemented yet.");
    } catch (e) {
      // Handling errors and returning a failure message
      return Left(LocalDatabaseFailure(
          message: e.toString(), statusCode: 500));
    }
  }
}
