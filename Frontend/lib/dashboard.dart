import 'package:flutter/material.dart';

import 'features/allotment/ui/car_allotment_tab.dart';
import 'features/parking/ui/parking_tab.dart';

enum Tabs { parking, alloted }

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedTab = Tabs.parking.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedTab,
        children: const [
          ParkingTab(),
          CarAllotmentTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedTab = value;
          });
        },
        currentIndex: selectedTab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking_rounded),
            label: 'Parking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Car Parked',
          ),
        ],
      ),
    );
  }
}
