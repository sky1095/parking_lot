import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_system/core/api/api_services/parking_lot_service.dart';
import 'package:parking_system/parking_lot_test_db.dart';

part 'allotment_event.dart';
part 'allotment_state.dart';

class AllotmentBloc extends Bloc<AllotmentEvent, AllotmentState> {
  final ParkingLotService _parkingLotService;

  AllotmentBloc(this._parkingLotService) : super(AllotmentInitial()) {
    on<AllotCarEvent>(_onAllotCarEvent);
  }

  Future<void> _onAllotCarEvent(
      AllotCarEvent event, Emitter<AllotmentState> emit) async {
    emit(LoadingState());
    final slot = await _parkingLotService.allocateCar(event.carSize);

    if (slot != null) {
      ParkinglotDb.addParkedCars(slot.id);
      emit(AllocatedCarState());
    } else {
      emit(ErrorState());
    }
  }
}
