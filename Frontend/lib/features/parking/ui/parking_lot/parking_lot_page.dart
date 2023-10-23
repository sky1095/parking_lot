import 'package:flutter/material.dart';
import 'package:parking_system/features/parking/ui/parking_slot/parking_slot_page.dart';

import '../../../../core/api/api_services/model/parking_lot_model.dart';
import '../../../../core/navigation/navigation_path.dart';

class ParkinglotPage extends StatelessWidget {
  final ParkingLotModel parkingLot;
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
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NavigationPath.parkingSlotPage,
                    arguments: ParkingSlotPageUiModel(
                      slotName: 'Floor ${floor.number + 1}',
                      slots: {
                        ParkingSlotSizeType.small: floor.slots
                            .where((slot) =>
                                slot.size == ParkingSlotSizeType.small)
                            .toList(),
                        ParkingSlotSizeType.medium: floor.slots
                            .where((slot) =>
                                slot.size == ParkingSlotSizeType.medium)
                            .toList(),
                        ParkingSlotSizeType.large: floor.slots
                            .where((slot) =>
                                slot.size == ParkingSlotSizeType.large)
                            .toList(),
                      },
                    ),
                  );
                },
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
              ),
            )
        ],
      ),
    );
  }
}
