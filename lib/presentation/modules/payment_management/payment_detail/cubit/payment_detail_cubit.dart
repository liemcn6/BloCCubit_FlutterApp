import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/payment/payment_detail_req_queries.dart';
import 'package:home_care/domain/entities/payment_management/payment_detail.dart';
import 'package:home_care/domain/entities/payment_management/payment_period.dart';
import 'package:home_care/domain/entities/payment_management/plan_period.dart';
import 'package:home_care/domain/usecases/payment_management/payment_detail_usecase.dart';

part 'payment_detail_state.dart';

class PaymentDetailCubit extends Cubit<PaymentDetailState> {
  final usecase = getIt.get<PaymentDetailUseCase>();
  late PaymentDetailReqQueries filter = PaymentDetailReqQueries(
    buildingServiceIds: state.servicesFilter
        .where((element) => element.selected && !Utils.isNullOrEmpty(element.serviceId))
        .map((e) => e.serviceId!)
        .toList(),
    unitIds: state.unitsFilter
        .where((element) => element.selected && !Utils.isNullOrEmpty(element.unitId))
        .map((e) => e.unitId!)
        .toList(),
  );
  final String paymentId;
  PaymentDetailCubit(this.paymentId) : super(PaymentDetailInitial());

  Future getPaymentDetail() async {
    final result = await usecase.getPaymentDetail(queries: filter, paymentId: paymentId);

    emit(state.copyWith(
      detail: result,
    ));

    filterUnitDisplay(result.periodTransactions);
    filterServiceDisplay(result.periodTransactions);
    if (state.unitsFilter.isEmpty) {
      filterUnit(result.periodTransactions);
    }
    if (state.servicesFilter.isEmpty) {
      filterService(result.periodTransactions);
    }
  }

  Future onRefresh() async {
    await getPaymentDetail();
  }

  getValuePlan(AppLocalizations tr) {
    String value = '';
    if (state.selectedAllUnit) return tr.all;
    for (var element in state.unitsFilter) {
      if (!Utils.isNullOrEmpty(element.unitId) && element.selected) {
        value = value + (!Utils.isNullOrEmpty(value) ? ', ${element.unitName}' : element.unitName!);
      }
    }
    return value;
  }

  getValueService(AppLocalizations tr) {
    String value = '';
    if (state.selectedAllService) return tr.all;
    for (var element in state.servicesFilter) {
      if (!Utils.isNullOrEmpty(element.serviceId) && element.selected) {
        value = value +
            (!Utils.isNullOrEmpty(value) ? ', ${element.serviceName}' : element.serviceName!);
      }
    }
    return value;
  }

  void filterUnit(List<PaymentPeriod> list) {
    final List<PlanPeriod> units = [...state.unitsFilter];
    for (var i = 0; i < list.length; i++) {
      PaymentPeriod element = list[i];
      if (!Utils.isNullOrEmpty(element.unitId)) {
        var exist = -1;
        exist = units.indexWhere((item) => item.unitId == element.unitId);
        if (exist == -1) {
          units.add(PlanPeriod(
            unitId: list[i].unitId!,
            unitName: list[i].unitName!,
            periodTransactions: [element],
            selected: false,
          ));
        } else {
          units[exist].periodTransactions.add(element);
        }
      }
    }

    emit(state.copyWith(
      unitsFilter: units,
    ));
  }

  void filterService(List<PaymentPeriod> list) {
    final List<PlanPeriod> services = [...state.servicesFilter];
    for (var i = 0; i < list.length; i++) {
      PaymentPeriod element = list[i];
      if (!Utils.isNullOrEmpty(element.buildingServiceId)) {
        var exist = services.indexWhere((item) => item.serviceId == element.buildingServiceId);
        if (exist == -1) {
          services.add(PlanPeriod(
            serviceId: element.buildingServiceId ?? '',
            serviceName: element.buildingServiceName ?? '',
            periodTransactions: [element],
            selected: false,
          ));
        } else {
          services[exist].periodTransactions.add(element);
        }
      }
    }

    emit(state.copyWith(
      servicesFilter: services,
    ));
  }

  void filterUnitDisplay(List<PaymentPeriod> list) {
    final List<PlanPeriod> units = [];
    for (var i = 0; i < list.length; i++) {
      PaymentPeriod element = list[i];
      var exist = -1;
      if (Utils.isNullOrEmpty(element.unitId)) {
        exist = units.indexWhere((item) => Utils.isNullOrEmpty(item.unitId));
      } else {
        exist = units.indexWhere((item) => item.unitId == element.unitId);
      }
      if (exist == -1) {
        units.add(PlanPeriod(
          unitId: list[i].unitId ?? '',
          unitName: list[i].unitName ?? '',
          periodTransactions: [element],
          selected: false,
        ));
      } else {
        units[exist].periodTransactions.add(element);
      }
    }

    emit(state.copyWith(
      units: units,
    ));
  }

  void filterServiceDisplay(List<PaymentPeriod> list) {
    final List<PlanPeriod> services = [];
    for (var i = 0; i < list.length; i++) {
      PaymentPeriod element = list[i];
      var exist = services.indexWhere((item) => item.unitId == element.unitId);
      if (exist == -1) {
        services.add(PlanPeriod(
          serviceId: list[i].buildingServiceId ?? '',
          serviceName: list[i].buildingServiceName ?? '',
          periodTransactions: [element],
          selected: false,
        ));
      } else {
        services[exist].periodTransactions.add(element);
      }
    }

    emit(state.copyWith(
      services: services,
    ));
  }

  void onChooseUnit({PlanPeriod? item, bool chooseAll = false}) {
    emit(state.copyWith(
      selectedAllUnit: chooseAll,
    ));

    if (chooseAll) {
      emit(state.copyWith(
        unitsFilter: state.unitsFilter.map((e) {
          return e.copyWith(
            selected: false,
          );
        }).toList(),
      ));
    } else {
      List<PlanPeriod> temps = state.unitsFilter.map((e) => e).toList();
      temps.removeWhere((element) => element.unitId == item!.unitId);
      bool hasSelected = temps.any((element) => element.selected);
      emit(state.copyWith(
        unitsFilter: state.unitsFilter.map((e) {
          if (e.unitId == item?.unitId) {
            return e.copyWith(
              selected: hasSelected == false ? true : !e.selected,
            );
          }
          return e;
        }).toList(),
      ));
    }
  }

  void onChooseService({PlanPeriod? item, bool chooseAll = false}) {
    emit(state.copyWith(
      selectedAllService: chooseAll,
    ));

    if (chooseAll) {
      emit(state.copyWith(
        servicesFilter: state.servicesFilter.map((e) {
          return e.copyWith(
            selected: false,
          );
        }).toList(),
      ));
    } else {
      List<PlanPeriod> temps = state.servicesFilter.map((e) => e).toList();
      temps.removeWhere((element) => element.serviceId == item!.serviceId);
      bool hasSelected = temps.any((element) => element.selected);
      emit(state.copyWith(
        servicesFilter: state.servicesFilter.map((e) {
          if (e.serviceId == item?.serviceId) {
            return e.copyWith(
              selected: hasSelected == false ? true : !e.selected,
            );
          }
          return e;
        }).toList(),
      ));
    }
  }

  void onDismissFilter({String type = 'unit'}) {
    if (type == 'unit') {
      emit(state.copyWith(
        selectedAllUnit: !Utils.isNullOrEmpty(filter.unitIds) ? filter.unitIds!.isEmpty : true,
        unitsFilter: state.unitsFilter.map((e) {
          return e.copyWith(
            selected: !Utils.isNullOrEmpty(filter.unitIds) && filter.unitIds!.contains(e.unitId!),
          );
        }).toList(),
      ));
    } else {
      final selectedAllService = !Utils.isNullOrEmpty(filter.buildingServiceIds)
          ? filter.buildingServiceIds!.isEmpty
          : true;
      final servicesFilter = state.servicesFilter.map((e) {
        return e.copyWith(
          selected: !Utils.isNullOrEmpty(filter.buildingServiceIds) &&
              filter.buildingServiceIds!.contains(e.serviceId!),
        );
      }).toList();

      emit(state.copyWith(
        selectedAllService: selectedAllService,
        servicesFilter: servicesFilter,
      ));
    }
  }

  void onConfirmFilter() {
    mapSelectedToFilter();
    getPaymentDetail();
  }

  void mapSelectedToFilter() {
    if (state.selectedAllUnit) {
      filter.unitIds = [];
    } else {
      filter.unitIds = state.unitsFilter
          .where((element) => element.selected)
          .map((e) => e.unitId)
          .cast<String>()
          .toList();
    }
    if (state.selectedAllService) {
      filter.buildingServiceIds = [];
    } else {
      filter.buildingServiceIds = state.servicesFilter
          .where((element) => element.selected)
          .map((e) => e.serviceId)
          .cast<String>()
          .toList();
    }
  }
}
