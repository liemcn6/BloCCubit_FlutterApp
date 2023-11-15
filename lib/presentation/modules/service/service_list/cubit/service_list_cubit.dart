import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/domain/entities/service/service_history.dart';

import '../../../../../core/core.dart';
import '../../../../../domain/entities/service/service_detail.dart';
import '../../../../../domain/entities/service/service_history_type.dart';
import '../../../../../domain/entities/service/service_list.dart';
import '../../../../../domain/usecases/service/service_list_usecase.dart';
import '../widgets/service_type_bottom_sheeet.dart';

part 'service_list_state.dart';

class ServiceListCubit extends Cubit<ServiceListState> {
  final _useCase = getIt.get<ServiceListUseCase>();

  ServiceListCubit() : super(const ServiceListState());

  Future<void> getInit({required BuildContext context}) async {
    ServiceList list = await _useCase.getServiceList();
    List<ServiceDetail> recent = await _useCase.getServiceRecent();
    emit(state.copyWith(serviceList: list, serviceRecent: recent, isListLoaded: true));
  }

  switchTab(ServiceScreenType type) {
    Log.i(type.name);
    emit(state.copyWith(type: type));
    if (state.serviceHistory.data.isEmpty) {
      _getServiceHistory();
    }
  }

  void chooseHistoryType(BuildContext context) async {
    final tr = Utils.languageOf(context);
    showServiceTypeBottomSheet(
      context: context,
      data: _getServiceHistoryType(),
      selectItem: state.serviceHistoryType,
      title: tr.service_type,
      onTap: (item) {
        if (item.id == null) {
          item = const ServiceHistoryTypeData(id: "", name: "");
        }
        emit(state.copyWith(serviceHistoryType: item));
        _getServiceHistory();
      },
    );
  }

  void emitDate(DateTime data) async {
    emit(state.copyWith(date: data, isTimeCleared: false));
    _getServiceHistory();
  }

  void clearDate() async {
    emit(state.copyWith(isTimeCleared: true));
    _getServiceHistory();
  }

  _getServiceHistory() async {
    emit(state.copyWith(isHistoryLoaded: false));
    Map<String, dynamic>? queries = {};
    if (state.date != null && state.isTimeCleared == false) {
      queries['registrationDate'] = DateTimeUtils.convertDate(state.date, 'yyyy-MM-dd');
    }
    if (state.serviceHistoryType != null) {
      queries['facilityIds'] = state.serviceHistoryType!.id ?? '';
    }
    ServiceHistory serviceHistory = await _useCase.getServiceHistory(queries);
    emit(state.copyWith(serviceHistory: serviceHistory, isHistoryLoaded: true));
  }

  Future<List<ServiceHistoryTypeData>> _getServiceHistoryType() async {
    final data = await _useCase.getServiceHistoryType();
    return data.data;
  }

  checkReloadHistory() {
    if (state.type == ServiceScreenType.history &&
        state.date == null &&
        state.serviceHistoryType == null) {
      _getServiceHistory();
    }
  }
}
