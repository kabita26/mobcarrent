import 'package:carrent/core/network/hive_service.dart';
import 'package:carrent/features/auth/data/auth_local_repository/auth_local_repository.dart';
import 'package:carrent/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:carrent/features/auth/domain/use_case/login_usecase.dart';
import 'package:carrent/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:carrent/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:carrent/features/auth/presentation/view_model/login/login_bloc.dart'; // LoginBloc
import 'package:carrent/features/home/presentation/view_model/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Initialize HiveService
  await _initHiveService();

  // Initialize Authentication Dependencies
  await _initAuthDependencies();

  // Initialize Home Dependencies
  _initHomeDependencies();
}

Future<void> _initHiveService() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

void _initHomeDependencies() {
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}

Future<void> _initAuthDependencies() async {
  // Register Local Data Source for Authentication
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // Register Local Repository for Authentication
  getIt.registerLazySingleton<AuthLocalRepository>(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // Register Use Cases (Login and Register)
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthLocalRepository>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthLocalRepository>()),
  );

  // Register Blocs (LoginBloc and RegisterBloc)
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(registerUseCase: getIt<RegisterUseCase>()),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUseCase: getIt<LoginUseCase>(),
      homeCubit: getIt<HomeCubit>(),
      registerBloc: getIt<RegisterBloc>(),
    ),
  );
}
