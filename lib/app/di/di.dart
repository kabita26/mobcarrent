import 'package:car_rent/core/network/api_server.dart';
import 'package:car_rent/core/network/hive_service.dart';
import 'package:car_rent/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:car_rent/features/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:car_rent/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:car_rent/features/auth/data/repository/remote_repository/auth_remote_repository.dart';
import 'package:car_rent/features/auth/domain/use_case/login_usecase.dart';
import 'package:car_rent/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:car_rent/features/auth/domain/use_case/upload_usecase.dart';
import 'package:car_rent/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:car_rent/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:car_rent/features/home/data/data_source/car_remote_data_source.dart';
import 'package:car_rent/features/home/data/repository/car_repository_impl.dart';
import 'package:car_rent/features/home/domain/repository/car_repository.dart';
import 'package:car_rent/features/home/domain/use_case/get_bookings.dart';
import 'package:car_rent/features/home/domain/use_case/get_car_listings.dart';
import 'package:car_rent/features/home/domain/use_case/search_cars.dart';
import 'package:car_rent/features/home/presentation/view_model/booking_cubit.dart';
import 'package:car_rent/features/home/presentation/view_model/home_cubit.dart';
import 'package:car_rent/features/home/presentation/view_model/search_cubit.dart';
import 'package:car_rent/features/splash/presentation/view_model/splash_screen_cubit.dart';
import 'package:car_rent/features/wishlist/data/data_source/remote_data_source/wishlist_remote_data_source.dart';
import 'package:car_rent/features/wishlist/data/repository/wishlist_remote_repository.dart';
import 'package:car_rent/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:car_rent/features/wishlist/domain/use_case/add_wishlist_usecase.dart';
import 'package:car_rent/features/wishlist/domain/use_case/get_wishlist.dart';
import 'package:car_rent/features/wishlist/domain/use_case/remove_wishlist_usecase.dart';
import 'package:car_rent/features/wishlist/presentation/view_model/wishlist_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // ------------------ Core Services ------------------
  getIt.registerLazySingleton<HiveService>(() => HiveService());
  getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);

  // ------------------ Auth Dependencies ------------------
  getIt.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasource(getIt<HiveService>()),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDatasource>()),
  );
  getIt.registerLazySingleton(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton(
    () => UploadImageUsecase(getIt<AuthLocalRepository>()),
  );
  getIt.registerLazySingleton<RegisterUserUsecase>(
    () => RegisterUserUsecase(getIt<AuthRemoteRepository>()),
  );
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt<RegisterUserUsecase>(),
      uploadImageUsecae: getIt<UploadImageUsecase>(),
    ),
  );

  // ------------------ Home Dependencies ------------------
  getIt.registerLazySingleton<CarRemoteDataSource>(
    () => CarRemoteDataSourceImpl(getIt<Dio>()),
  );
  getIt.registerLazySingleton<CarRepository>(
    () => CarRepositoryImpl(getIt<CarRemoteDataSource>()),
  );
  getIt.registerLazySingleton<GetCarListings>(
    () => GetCarListings(getIt<CarRepository>()),
  );
  getIt.registerLazySingleton<GetBookings>(
    () => GetBookings(getIt<CarRepository>()),
  );
  getIt.registerLazySingleton<GetSearchResults>(
    () => GetSearchResults(getIt<CarRepository>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<GetCarListings>()));
  getIt.registerFactory<BookingCubit>(() => BookingCubit(getIt<GetBookings>()));
  // getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<GetSearchResults>()));

  // ------------------ Wishlist Dependencies ------------------
  getIt.registerLazySingleton<IWishlistDataSource>(
    () => WishlistRemoteDataSource(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<IWishlistRepository>(
    () => WishlistRepositoryImpl(getIt<IWishlistDataSource>()),
  );
  getIt.registerLazySingleton(() => GetWishlistUseCase(getIt<IWishlistRepository>()));
  getIt.registerLazySingleton(() => AddToWishlistUseCase(getIt<IWishlistRepository>()));
  getIt.registerLazySingleton(() => RemoveFromWishlistUseCase(getIt<IWishlistRepository>()));
  getIt.registerFactory<WishlistBloc>(
    () => WishlistBloc(
      getWishlistUseCase: getIt<GetWishlistUseCase>(),
      addToWishlistUseCase: getIt<AddToWishlistUseCase>(),
      removeFromWishlistUseCase: getIt<RemoveFromWishlistUseCase>(),
    ),
  );
  // getIt.registerFactory<WishlistCubit>(() => WishlistCubit(getIt<WishlistBloc>()));

  // ------------------ Login Dependencies ------------------
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRemoteRepository>()),
  );
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );

  // ------------------ Splash Screen Dependency ------------------
  getIt.registerFactory<SplashScreenCubit>(
    () => SplashScreenCubit(getIt<LoginBloc>()),
  );
}
