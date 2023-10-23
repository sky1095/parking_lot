import 'package:flutter/material.dart';

import 'core/di/app_dependency_injector.dart';
import 'core/navigation/app_navigation.dart';
import 'core/navigation/navigation_path.dart';

void main() {
  AppDependencyInjector.setup();
  runApp(const ParkingSystemApp());
}

class ParkingSystemApp extends StatelessWidget {
  const ParkingSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking System',
      initialRoute: NavigationPath.dashboard,
      onGenerateRoute: AppNavigation.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
    );
  }
}


// json for a parking lot