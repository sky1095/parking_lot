import 'package:flutter/material.dart';

import '../../../../core/api/api_services/model/parking_lot_model.dart';
import 'widgets/parking_slot_item_widget.dart';

class ParkingSlotPage extends StatelessWidget {
  final ParkingSlotPageUiModel uiModel;
  const ParkingSlotPage({super.key, required this.uiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          uiModel.slotName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(children: [
        for (final entry in uiModel.slots.entries)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(entry.key.name),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: [
                    for (final slot in entry.value)
                      ParkingSlotItemWidget(slot: slot)
                  ],
                )
              ],
            ),
          )
      ]),
    );
  }
}

class ParkingSlotPageUiModel {
  final String slotName;
  final Map<ParkingSlotSizeType, List<Slot>> slots;

  ParkingSlotPageUiModel({required this.slotName, required this.slots});
}
