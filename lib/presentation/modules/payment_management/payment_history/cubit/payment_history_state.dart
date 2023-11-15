part of 'payment_history_cubit.dart';

class PaymentHistoryState extends Equatable {
  final List<PaymentHistory> listPayments;
  final bool isLoaded;

  const PaymentHistoryState({
    this.listPayments = const [],
    this.isLoaded = true,
  });

  PaymentHistoryState copyWith({
    List<PaymentHistory>? listPayments,
    bool? isLoaded,
  }) {
    return PaymentHistoryState(
      listPayments: listPayments ?? this.listPayments,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object> get props => [
        listPayments,
        isLoaded,
      ];
}

final class PaymentHistoryInitial extends PaymentHistoryState {}
