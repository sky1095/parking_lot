import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_system/core/api/api_services/parking_lot_service.dart';
import 'package:parking_system/parking_lot_test_db.dart';

import '../../../../core/api/api_services/model/parking_lot_model.dart';
import '../model/request_model/create_parking_lot_request_model.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final ParkingLotService _parkingLotService;

  OnboardingBloc(this._parkingLotService) : super(OnboardingInitial()) {
    on<CreateParkingLotEvent>(_onCreateParkingLotEvent);
  }

  Future<void> _onCreateParkingLotEvent(
      CreateParkingLotEvent event, Emitter<OnboardingState> emit) async {
    emit(LoadingState());
    final parkingLot =
        await _parkingLotService.addParkingLot(event.requestModel);

    if (parkingLot != null) {
      ParkinglotDb.addParkinglot(parkingLot);
      emit(ParkingLotCreatedState(parkingLot: parkingLot));
    } else {
      emit(ErrorState());
    }
  }
}
