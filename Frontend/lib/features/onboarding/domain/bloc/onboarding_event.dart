part of 'onboarding_bloc.dart';

sealed class OnboardingEvent {}

class CreateParkingLotEvent extends OnboardingEvent {
  final CreateParkingLotRequestModel requestModel;

  CreateParkingLotEvent({required this.requestModel});
}
