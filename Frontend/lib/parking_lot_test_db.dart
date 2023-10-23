import 'dart:collection';

import 'core/api/api_services/model/parking_lot_model.dart';

class ParkinglotDb {
  static final HashMap<String, ParkingLotModel> _parkinglots =
      HashMap<String, ParkingLotModel>();

  static final HashMap<String, ParkingLotModel> _parkedCars =
      HashMap<String, ParkingLotModel>();

  static List<ParkingLotModel> get parkinglots => _parkinglots.values.toList();
  static List<ParkingLotModel> get parkedCars => _parkedCars.values.toList();

  static void addParkinglot(ParkingLotModel newParkinglot) {
    _parkinglots[newParkinglot.id] = newParkinglot;
  }

  static void addParkedCars(String id) {
    for (final lot in _parkinglots.values) {
      for (final floor in lot.floors) {
        for (final slot in floor.slots) {
          if (slot.id == id) {
            _parkedCars[id] = lot;
          }
        }
      }
    }
  }

  static void removeParkinglot(String id) {
    _parkinglots.remove(id);
  }
}
