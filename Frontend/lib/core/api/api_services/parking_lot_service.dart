import 'package:parking_system/core/api/api_clients/parking_api_client.dart';
import 'package:parking_system/core/api/api_services/model/parking_lot_model.dart';

import '../../../features/onboarding/domain/model/request_model/create_parking_lot_request_model.dart';

class ParkingLotService {
  final ParkingApiClient _apiClient;

  ParkingLotService({required ParkingApiClient apiClient})
      : _apiClient = apiClient;

  Future<ParkingLotModel?> addParkingLot(
      CreateParkingLotRequestModel requestModel) async {
    const path = 'addOrUpdateParkingLot';
    final response = await _apiClient.post(
      path,
      body: requestModel.createRequestPayload,
    );

    if (response.statusCode == 200) {
      return ParkingLotModel.fromMap(response.data);
    }
    return null;
  }

  Future<Slot?> allocateCar(String carSize) async {
    const path = 'getSlot';
    final response = await _apiClient.post(
      path,
      body: {"size": carSize},
    );

    if (response.statusCode == 200) {
      return Slot.fromMap(response.data);
    }
    return null;
  }
}
