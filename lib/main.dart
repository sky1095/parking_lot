import 'package:flutter/material.dart';
import 'package:parking_system/dashboard.dart';

void main() {
  runApp(const ParkingSystemApp());
}

class ParkingSystemApp extends StatelessWidget {
  const ParkingSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}


// json for a parking lot