import 'package:car_rent/core/theme/app_theme.dart';
import 'package:car_rent/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:car_rent/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:car_rent/features/home/presentation/view_model/booking_cubit.dart';
import 'package:car_rent/features/home/presentation/view_model/home_cubit.dart';
import 'package:car_rent/features/home/presentation/view_model/search_cubit.dart';
import 'package:car_rent/features/home/presentation/view_model/wishlist_cubit.dart';
import 'package:car_rent/features/splash/presentation/view_model/splash_screen_cubit.dart';
import 'package:car_rent/view/onboardview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/app/di/di.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SplashScreenCubit>()),
        BlocProvider(create: (_) => getIt<LoginBloc>()),
        BlocProvider(create: (_) => getIt<RegisterBloc>()),
        BlocProvider(create: (_) => getIt<HomeCubit>()),
        BlocProvider(create: (_) => getIt<WishlistCubit>()),
        BlocProvider(create: (_) => getIt<BookingCubit>()),
        BlocProvider(create: (_) => getIt<SearchCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HIRX',
        theme: AppTheme.getApplicationTheme(isDarkMode: false),
        home:  OnboardView(),
      ),
    );
  }
}
