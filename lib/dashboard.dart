import 'package:flutter/material.dart';
import 'package:parking_system/parking_lot_test_db.dart';

import 'features/onboarding/ui/helper/onboarding_dialog.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void _addLot() {
    OnboardingDialog.showOnboardingDialog(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking lots'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            bottom: MediaQuery.of(context).padding.bottom,
            right: 8.0,
            left: 8.0,
          ),
          child: Wrap(
            spacing: 18,
            runSpacing: 16,
            children: [
              for (final item in ParkinglotDb.parkinglots)
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(item.name),
                      const Icon(Icons.local_parking_rounded),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addLot,
        tooltip: 'Add Parking lot',
        child: const Icon(Icons.add),
      ),
    );
  }
}
