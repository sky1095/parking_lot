import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_system/core/navigation/navigation_path.dart';
import 'package:parking_system/features/onboarding/domain/bloc/onboarding_bloc.dart';
import 'package:parking_system/parking_lot_test_db.dart';

import '../../../core/di/app_dependency_injector.dart';
import '../../onboarding/ui/helper/onboarding_dialog.dart';

class ParkingTab extends StatefulWidget {
  const ParkingTab({super.key});

  @override
  State<ParkingTab> createState() => _ParkingTabState();
}

class _ParkingTabState extends State<ParkingTab> {
  final onboardingBloc = AppDependencyInjector.getIt.get<OnboardingBloc>();

  void _addLot() {
    OnboardingDialog.showOnboardingDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Parking lots',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        bloc: onboardingBloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ParkingLotCreatedState || state is OnboardingInitial) {
            if (ParkinglotDb.parkinglots.isEmpty) {
              return const Center(
                child: Text('Lots are empty, please try adding some'),
              );
            }
            return SingleChildScrollView(
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NavigationPath.parkingLotPage,
                            arguments: item,
                          );
                        },
                        child: Container(
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
                        ),
                      )
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: Text('Server Error, please try again'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addLot,
        tooltip: 'Add Parking lot',
        label: const Row(
          children: [
            Text('Add Parking lot'),
          ],
        ),
      ),
    );
  }
}
