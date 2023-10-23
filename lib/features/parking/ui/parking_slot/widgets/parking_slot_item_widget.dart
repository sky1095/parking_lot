import 'package:flutter/material.dart';

import '../../../../onboarding/domain/onboarding_entity.dart';

class ParkingSlotItemWidget extends StatelessWidget {
  final Slot slot;
  const ParkingSlotItemWidget({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: slot.isOccupied ? Colors.red : Colors.green,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          slot.id.split(':').last,
        ),
      ),
    );
  }
}
