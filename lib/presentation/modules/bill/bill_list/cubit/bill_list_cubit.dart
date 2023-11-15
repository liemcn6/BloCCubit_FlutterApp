import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/domain/entities/bill/bill_list.dart';
import 'package:home_care/domain/usecases/bill/bill_list_usecase.dart';
import 'package:home_care/presentation/modules/bill/bill_list/models/bill_status.dart';

import '../../../../../core/core.dart';
import '../../../../../domain/entities/bottom_sheet/row_item.dart';
import '../../../../../domain/usecases/building/building_usecase.dart';
import '../../../../widgets/list_bottom_sheeet.dart';
import '../../../../widgets/list_string_bottom_sheet.dart';

part 'bill_list_state.dart';

class BillListCubit extends Cubit<BillListState> {
  var statusKeys = ['PAID', 'UNPAID', 'PAID_PARTIAL', 'CANCEL'];
  final _billListUseCase = getIt.get<BillListUseCase>();
  final _buildingUsecase = getIt.get<BuildingUseCase>();

  BillListCubit() : super(const BillListState());
  Future<void> getInit({required BuildContext context}) async {
    _getBillList();
  }

  void chooseBuilding(BuildContext context) async {
    final tr = Utils.languageOf(context);
    showListBottomSheet(
      context: context,
      data: _getBuildingList(),
      selectItem: state.building,
      title: tr.choose_building,
      onTap: (item) {
        emit(state.copyWith(building: item));
        _getBillList();
      },
    );
  }

  void chooseStatus(BuildContext context) async {
    final tr = Utils.languageOf(context);
    showListStringBottomSheet(
      context: context,
      data: _listStatus(context),
      selectItem: state.billStatus.status,
      title: tr.choose_status,
      onTap: (index) {
        if (index >= 0) {
          emit(state.copyWith(
              billStatus:
                  BillStatus(key: statusKeys[index], status: tr.bill_status(statusKeys[index]))));
        } else {
          emit(state.copyWith(billStatus: const BillStatus()));
        }
        _getBillList();
      },
    );
  }

  _getBillList() async {
    emit(state.copyWith(isLoaded: false));
    Map<String, dynamic>? queries = {};
    queries['buildingIds'] = state.building.id ?? '';
    queries['paymentStatuses'] = state.billStatus.key ?? '';
    BillList billList = await _billListUseCase.getBillList(queries);
    emit(state.copyWith(billList: billList, isLoaded: true));
  }

  Future<List<RowItem>> _getBuildingList() async {
    final buildingList = await _buildingUsecase.getBuildingList();

    if (buildingList.length == 1) {
      emit(state.copyWith(building: buildingList[0]));
      _getBillList();
    }

    return buildingList;
  }

  Future<List<String>> _listStatus(BuildContext context) async {
    final tr = Utils.languageOf(context);
    return [
      tr.bill_status(statusKeys[0]),
      tr.bill_status(statusKeys[1]),
      tr.bill_status(statusKeys[2]),
    ];
  }
}
