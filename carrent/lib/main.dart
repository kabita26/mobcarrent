

import 'package:carrent/app/app.dart';
import 'package:carrent/app/di/di.dart';
import 'package:carrent/core/network/hive_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService().init();

  await initDependencies();
  runApp(
    App(),
  );
}
