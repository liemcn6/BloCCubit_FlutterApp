part of 'bill_history_cubit.dart';

class BillHistoryState extends Equatable {
  final List<InvoicePaymentHistory> invoicePaymentHistories;
  final bool isLoaded;

  const BillHistoryState({
    this.invoicePaymentHistories = const [],
    this.isLoaded = false,
  });

  @override
  List<Object> get props => [
        invoicePaymentHistories,
        isLoaded,
      ];

  BillHistoryState copyWith({
    List<InvoicePaymentHistory>? invoicePaymentHistories,
    bool? isLoaded,
  }) {
    return BillHistoryState(
      invoicePaymentHistories: invoicePaymentHistories ?? this.invoicePaymentHistories,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

final class BillHistoryInitial extends BillHistoryState {}
