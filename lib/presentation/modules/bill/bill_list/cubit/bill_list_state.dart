part of 'bill_list_cubit.dart';

class BillListState extends Equatable {
  final BillList billList;
  final RowItem building;
  final BillStatus billStatus;
  final bool isLoaded;

  const BillListState({
    this.billList = const BillList(),
    this.building = const RowItem(),
    this.billStatus = const BillStatus(),
    this.isLoaded = true,
  });

  BillListState copyWith({
    BillList? billList,
    RowItem? building,
    BillStatus? billStatus,
    bool? isLoaded,
  }) {
    return BillListState(
      billList: billList ?? this.billList,
      building: building ?? this.building,
      billStatus: billStatus ?? this.billStatus,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object?> get props => [billList, building, billStatus, isLoaded];
}
