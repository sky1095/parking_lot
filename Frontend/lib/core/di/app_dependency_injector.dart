import 'package:get_it/get_it.dart';
import 'package:parking_system/core/api/api_clients/parking_api_client.dart';
import 'package:parking_system/env.dart';

import '../../features/allotment/domain/bloc/allotment_bloc.dart';
import '../../features/onboarding/domain/bloc/onboarding_bloc.dart';
import '../api/api_services/parking_lot_service.dart';

class AppDependencyInjector {
  AppDependencyInjector._();

  static final getIt = GetIt.instance;

  static void setup() {
    getIt.registerLazySingleton<ParkingApiClient>(
      () => ParkingApiClient(baseUrl: Env.baseUrl),
    );

    getIt.registerLazySingleton<ParkingLotService>(
      () => ParkingLotService(
        apiClient: getIt.get<ParkingApiClient>(),
      ),
    );

    getIt.registerLazySingleton<OnboardingBloc>(
      () => OnboardingBloc(getIt.get<ParkingLotService>()),
    );

    getIt.registerLazySingleton<AllotmentBloc>(
      () => AllotmentBloc(getIt.get<ParkingLotService>()),
    );
  }
}
