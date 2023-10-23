import 'package:flutter/material.dart';
import 'package:parking_system/core/api/api_services/model/parking_lot_model.dart';
import 'package:parking_system/dashboard.dart';

import '../../features/parking/ui/parking_lot/parking_lot_page.dart';
import '../../features/parking/ui/parking_slot/parking_slot_page.dart';
import 'navigation_path.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case NavigationPath.dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());

      case NavigationPath.parkingLotPage:
        return MaterialPageRoute(
          builder: (_) => ParkinglotPage(parkingLot: args as ParkingLotModel),
        );

      case NavigationPath.parkingSlotPage:
        return MaterialPageRoute(
          builder: (_) => ParkingSlotPage(
            uiModel: args as ParkingSlotPageUiModel,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('404: Page not found'),
            ),
          ),
        );
    }
  }
}
