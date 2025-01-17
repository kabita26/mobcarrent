import 'package:carrent/app/di/di.dart';
import 'package:carrent/core/theme/app_theme.dart';
import 'package:carrent/splash/presentation/view/splash_view.dart';
import 'package:carrent/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarRental',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider<SplashCubit>(
        create: (_) => getIt<SplashCubit>(),
        child: SplashView(),
      ),
    );
  }
}
