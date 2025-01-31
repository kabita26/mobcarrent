import 'package:flutter/material.dart';
import 'package:car_rent/app/app.dart';
import 'package:car_rent/app/di/di.dart';
import 'package:car_rent/core/network/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  await initDependencies();
  runApp(const MyApp());
}
