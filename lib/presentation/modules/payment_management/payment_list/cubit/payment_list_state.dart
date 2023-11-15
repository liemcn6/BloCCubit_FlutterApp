part of 'payment_list_cubit.dart';

final class ContractPaymentStatus {
  ContractPaymentStatus._();

  static const String paid = 'paid';
  static const String unpaid = 'unpaid';
}

class PaymentListState extends Equatable {
  final List<ContractModel> paymentList;
  final PaymentStatistic statistic;
  final bool isLoaded;

  const PaymentListState({
    this.paymentList = const [],
    this.statistic = const PaymentStatistic(),
    this.isLoaded = false,
  });

  @override
  List<Object> get props => [
        paymentList,
        statistic,
        isLoaded,
      ];

  PaymentListState copyWith({
    List<ContractModel>? paymentList,
    PaymentStatistic? statistic,
    bool? isLoaded,
  }) {
    return PaymentListState(
      paymentList: paymentList ?? this.paymentList,
      statistic: statistic ?? this.statistic,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

final class PaymentListInitial extends PaymentListState {}
