part of 'allotment_bloc.dart';

sealed class AllotmentState {}

final class AllotmentInitial extends AllotmentState {}

final class AllocatedCarState extends AllotmentState {}

final class LoadingState extends AllotmentState {}

final class ErrorState extends AllotmentState {}
