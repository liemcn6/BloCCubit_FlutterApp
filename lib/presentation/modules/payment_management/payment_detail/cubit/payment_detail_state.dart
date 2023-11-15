part of 'payment_detail_cubit.dart';

class PaymentDetailState extends Equatable {
  final List<PlanPeriod> units;
  final List<PlanPeriod> services;
  final PaymentDetail detail;
  final bool selectedAllUnit;
  final List<PlanPeriod> unitsFilter;
  final bool selectedAllService;
  final List<PlanPeriod> servicesFilter;
  final bool isLoaded;

  const PaymentDetailState({
    this.units = const [],
    this.services = const [],
    this.detail = const PaymentDetail(
      needToPay: 0,
      paidAmount: 0,
      total: 0,
      periodTransactions: [],
    ),
    this.selectedAllUnit = true,
    this.unitsFilter = const [],
    this.selectedAllService = true,
    this.servicesFilter = const [],
    this.isLoaded = false,
  });

  @override
  List<Object> get props => [
        units,
        detail,
        selectedAllUnit,
        unitsFilter,
        selectedAllService,
        servicesFilter,
        isLoaded,
        services,
      ];

  PaymentDetailState copyWith({
    List<PlanPeriod>? units,
    PaymentDetail? detail,
    bool? selectedAllUnit,
    List<PlanPeriod>? unitsFilter,
    bool? selectedAllService,
    List<PlanPeriod>? servicesFilter,
    bool? isLoaded,
    List<PlanPeriod>? services,
  }) {
    return PaymentDetailState(
      units: units ?? this.units,
      detail: detail ?? this.detail,
      selectedAllUnit: selectedAllUnit ?? this.selectedAllUnit,
      unitsFilter: unitsFilter ?? this.unitsFilter,
      selectedAllService: selectedAllService ?? this.selectedAllService,
      servicesFilter: servicesFilter ?? this.servicesFilter,
      isLoaded: isLoaded ?? this.isLoaded,
      services: services ?? this.services,
    );
  }
}

final class PaymentDetailInitial extends PaymentDetailState {}
