import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_history.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_list/cubit/vehicle_list_state.dart';

import '../../../../../domain/entities/vehicle/vehicle_list.dart';
import '../../../../../domain/usecases/vehicle/vehicle_list_usecase.dart';

class VehicleListCubit extends Cubit<VehicleListState> {
  final _useCase = getIt.get<VehicleListUseCase>();

  VehicleListCubit() : super(VehicleListState());

  Future<void> getInit({required BuildContext context}) async {
    emit(state.copyWith(isLoaded: false));
    VehicleList vehicleList = await _useCase.getVehicleList();
    VehicleHistory vehicleHistory = await _useCase.getVehicleHistory();
    emit(state.copyWith(vehicleList: vehicleList, vehicleHistory: vehicleHistory, isLoaded: true));
  }

  void switchTab(TabType type) {
    Log.i(type.name);
    emit(state.copyWith(type: type));
  }
}
