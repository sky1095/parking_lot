import 'package:flutter/material.dart';
import 'package:parking_system/features/onboarding/domain/onboarding_entity.dart';

class ParkinglotPage extends StatelessWidget {
  final OnboardingEntity parkingLot;
  const ParkinglotPage({super.key, required this.parkingLot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          parkingLot.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          for (final floor in parkingLot.floors.reversed)
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all()),
                child: Center(
                  child: Text(
                    'Floor ${floor.number + 1}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
