part of 'bill_detail_cubit.dart';

class BillDetailState extends Equatable {
  final bool isLoaded;
  final BillDetail billDetail;

  BillDetailState({
    this.isLoaded = false,
    BillDetail? billDetail,
  }) : billDetail = billDetail ?? BillDetail.withDefault();

  @override
  List<Object> get props => [
        isLoaded,
        billDetail,
      ];

  BillDetailState copyWith({
    bool? isLoaded,
    BillDetail? billDetail,
  }) {
    return BillDetailState(
      isLoaded: isLoaded ?? this.isLoaded,
      billDetail: billDetail ?? this.billDetail,
    );
  }
}

final class BillDetailInitial extends BillDetailState {}
