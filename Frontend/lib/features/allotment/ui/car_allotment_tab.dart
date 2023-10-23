import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_system/core/navigation/navigation_path.dart';
import 'package:parking_system/features/allotment/domain/bloc/allotment_bloc.dart';
import 'package:parking_system/parking_lot_test_db.dart';

import '../../../core/di/app_dependency_injector.dart';

class CarAllotmentTab extends StatefulWidget {
  const CarAllotmentTab({super.key});

  @override
  State<CarAllotmentTab> createState() => _CarAllotmentTabState();
}

class _CarAllotmentTabState extends State<CarAllotmentTab> {
  final allotmentBloc = AppDependencyInjector.getIt.get<AllotmentBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Car Parked',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
        ),
        body: BlocBuilder<AllotmentBloc, AllotmentState>(
          bloc: allotmentBloc,
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is AllocatedCarState || state is AllotmentInitial) {
              if (ParkinglotDb.parkedCars.isEmpty) {
                return const Center(
                  child: Text('No Cars parked, Add few!'),
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
                      for (final item in ParkinglotDb.parkedCars)
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
                                const Icon(Icons.car_rental),
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (final size in CarSize.values)
              ElevatedButton(
                onPressed: () {
                  allotmentBloc.add(AllotCarEvent(
                      carSize:
                          size.name[0].toUpperCase() + size.name.substring(1)));
                },
                child: Text(size.name),
              ),
          ],
        ));
  }
}

enum CarSize { small, medium, large }
