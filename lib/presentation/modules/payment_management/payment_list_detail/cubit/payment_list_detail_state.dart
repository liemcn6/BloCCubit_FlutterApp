part of 'payment_list_detail_cubit.dart';

class PaymentListDetailState extends Equatable {
  final List<PaymentItem> listPayments;
  final PaymentStatistic statistic;
  final bool isLoaded;

  const PaymentListDetailState({
    this.listPayments = const [],
    this.statistic = const PaymentStatistic(),
    this.isLoaded = false,
  });

  @override
  List<Object> get props => [
        listPayments,
        statistic,
        isLoaded,
      ];

  PaymentListDetailState copyWith({
    List<PaymentItem>? listPayments,
    PaymentStatistic? statistic,
    bool? isLoaded,
  }) {
    return PaymentListDetailState(
      listPayments: listPayments ?? this.listPayments,
      statistic: statistic ?? this.statistic,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

final class PaymentListDetailInitial extends PaymentListDetailState {}
