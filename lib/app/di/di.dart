import 'package:car_rent/core/network/api_server.dart';
import 'package:car_rent/features/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:car_rent/features/auth/data/repository/remote_repository/auth_remote_repository.dart';
import 'package:car_rent/features/auth/domain/use_case/login_usecase.dart';
import 'package:car_rent/features/auth/domain/use_case/upload_usecase.dart';
import 'package:car_rent/features/splash/presentation/view_model/splash_screen_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:car_rent/core/network/hive_service.dart';
import 'package:car_rent/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:car_rent/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:car_rent/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:car_rent/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:car_rent/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:car_rent/features/home/presentation/view_model/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();

  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();

  await _initSplashScreenDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initRegisterDependencies() {
  // init local data source
  // =========================== Data Source ===========================

  getIt.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  // =========================== Repository ===========================

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDatasource>()),
  );

  // init remote repository
  getIt.registerLazySingleton(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton(
    () => UploadImageUsecase(getIt<AuthLocalRepository>()),
  );

  // register use usecase
  // getIt.registerLazySingleton<RegisterUseCase>(
  //   () => RegisterUseCase(
  //     getIt<AuthLocalRepository>(),
  //   ),
  // );

  // =========================== Usecases ===========================

  getIt.registerLazySingleton<RegisterUserUsecase>(
    () => RegisterUserUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );
 

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
      uploadImageUsecae: getIt(),
    ),
  );
}
// =========================== Data Source ===========================

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  // getIt.registerLazySingleton<LoginUseCase>(
  //   () => LoginUseCase(
  //     getIt<AuthLocalRepository>(),
  //   ),
  // );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashScreenCubit>(
    () => SplashScreenCubit(getIt<LoginBloc>()),
  );
}
