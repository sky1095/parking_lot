import 'dart:collection';

import 'features/onboarding/domain/onboarding_entity.dart';

class ParkinglotDb {
  static final HashMap<String, OnboardingEntity> _parkinglots =
      HashMap<String, OnboardingEntity>();

  static List<OnboardingEntity> get parkinglots => _parkinglots.values.toList();

  static void addParkinglot(String name, String location) {
    for (int k = 0; k < 30; ++k) {
      OnboardingEntity newParkinglot = OnboardingEntity(
          name: name,
          location: location,
          id: 'parking_lot_${_parkinglots.length + 1}',
          floors: [
            for (int i = 0; i < 3; ++i)
              Floor(
                id: '${'parking_lot_${_parkinglots.length + 1}'}:floor$i',
                number: i,
                slots: [
                  for (int j = 0; j < 10; ++j)
                    Slot(
                      id: '${'parking_lot_${_parkinglots.length + 1}'}:floor_$i:slot_$j',
                      size: ParkingSlotSizeType.small,
                      isOccupied: false,
                    ),
                  for (int j = 10; j < 20; ++j)
                    Slot(
                      id: '${'parking_lot_${_parkinglots.length + 1}'}:floor_$i:slot_$j',
                      size: ParkingSlotSizeType.medium,
                      isOccupied: false,
                    ),
                  for (int j = 20; j < 30; ++j)
                    Slot(
                      id: '${'parking_lot_${_parkinglots.length + 1}'}:floor_$i:slot_$j',
                      size: ParkingSlotSizeType.large,
                      isOccupied: false,
                    )
                ],
              )
          ]);
      _parkinglots[newParkinglot.id] = newParkinglot;
    }
  }

  static void removeParkinglot(String id) {
    _parkinglots.remove(id);
  }
}
