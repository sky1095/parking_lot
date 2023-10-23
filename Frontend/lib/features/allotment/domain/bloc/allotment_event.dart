part of 'allotment_bloc.dart';

sealed class AllotmentEvent {}

class AllotCarEvent extends AllotmentEvent {
  final String carSize;

  AllotCarEvent({required this.carSize});
}
