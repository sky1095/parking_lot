part of 'onboarding_bloc.dart';

sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class ParkingLotCreatedState extends OnboardingState {
  final ParkingLotModel parkingLot;

  ParkingLotCreatedState({required this.parkingLot});
}

final class LoadingState extends OnboardingState {}

final class ErrorState extends OnboardingState {}
