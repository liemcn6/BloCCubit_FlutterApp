import 'payment_period.dart';

class PlanPeriod {
  final String? unitId;
  final String? unitName;
  final String? serviceId;
  final String? serviceName;
  final bool selected;
  final List<PaymentPeriod> periodTransactions;

  PlanPeriod({
    this.unitId,
    this.unitName,
    this.serviceId,
    this.serviceName,
    required this.selected,
    required this.periodTransactions,
  });

  PlanPeriod copyWith({
    String? unitId,
    String? unitName,
    String? serviceId,
    String? serviceName,
    bool? selected,
    List<PaymentPeriod>? periodTransactions,
  }) {
    return PlanPeriod(
      unitId: unitId ?? this.unitId,
      unitName: unitName ?? this.unitName,
      serviceId: serviceId ?? this.serviceId,
      serviceName: serviceName ?? this.serviceName,
      selected: selected ?? this.selected,
      periodTransactions: periodTransactions ?? this.periodTransactions,
    );
  }
}
