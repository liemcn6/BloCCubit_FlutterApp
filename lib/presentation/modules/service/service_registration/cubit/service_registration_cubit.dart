import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/service/service_location_queries.dart';
import 'package:home_care/data/models/request/service/service_registration_body.dart';
import 'package:home_care/data/models/response/service/service_time_frame_data.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/service/service_location.dart';
import 'package:home_care/domain/usecases/service/service_registration_usecase.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/calendar_bottom_sheet.dart';
import 'package:home_care/presentation/widgets/list_bottom_sheeet.dart';

part 'service_registration_state.dart';

class ServiceRegistrationCubit extends Cubit<ServiceRegistrationState> {
  final _useCase = getIt.get<ServiceRegistrationUseCase>();

  ServiceRegistrationCubit() : super(ServiceRegistrationInitial());

  TextEditingController priceCtrl = TextEditingController();

  TextEditingController totalMoneyCtrl = TextEditingController();

  TextEditingController noteCtrl = TextEditingController();

  void selectServiceGroup(BuildContext context) {
    final tr = Utils.languageOf(context);
    showListBottomSheet(
      context: context,
      data: _useCase.getServiceGroupList(),
      title: tr.service_group,
      selectItem: state.serviceGroup,
      onTap: (val) => emit(state.copyWith(
        serviceGroup: val,
        serviceType: RowItem.empty(),
        timeFrame: RowItem.empty(),
        locationTag: RowItem.empty(),
      )),
    );
  }

  void selectServiceType(BuildContext context) {
    if (state.serviceGroup.id == null) {
      return;
    }

    final tr = Utils.languageOf(context);
    showListBottomSheet(
      context: context,
      data: _useCase.getServiceTypeList(state.serviceGroup.id!),
      title: tr.service_type,
      selectItem: state.serviceType,
      onTap: (val) => emit(state.copyWith(
        serviceType: val,
        timeFrame: RowItem.empty(),
        locationTag: RowItem.empty(),
      )),
    );
  }

  selectDate(BuildContext context) {
    showCalendarBottomSheet(
      context: context,
      currentDay: state.date,
      firstDay: DateTime.now(),
      onChange: (date) => emit(state.copyWith(date: date)),
      mode: CupertinoDatePickerMode.date,
    );
  }

  selectTimeFrame(BuildContext context) {
    if (state.serviceType.id == null) {
      return;
    }

    final tr = Utils.languageOf(context);
    showListBottomSheet(
      context: context,
      data: _useCase.getServiceTimeFrameList(state.serviceType.id!),
      title: tr.registration_date,
      selectItem: state.timeFrame,
      onTap: (val) => {
        priceCtrl.text = '',
        totalMoneyCtrl.text = '',
        emit(state.copyWith(
          timeFrame: val,
          locationTag: RowItem.empty(),
        ))
      },
    );
  }

  selectLocationTag(BuildContext context) {
    if (state.serviceType.id == null || state.timeFrame.value == null) {
      return;
    }

    final tr = Utils.languageOf(context);
    showListBottomSheet(
        context: context,
        data: _getServiceLocation(tr),
        title: tr.location,
        selectItem: state.locationTag,
        onTap: (val) => {
              priceCtrl.text = val.value?.unitPrice == null
                  ? ''
                  : StringUtils.formatStringToCash(cash: val.value?.unitPrice),
              totalMoneyCtrl.text = val.value?.unitPrice == null
                  ? ''
                  : StringUtils.formatStringToCash(cash: val.value?.unitPrice),
              emit(state.copyWith(locationTag: val)),
            });
  }

  bool checkValid() =>
      state.serviceGroup.id != null &&
      state.serviceType.id != null &&
      state.timeFrame.value != null &&
      state.locationTag.value != null;

  void registerService() async {
    Utils.dismissKeyboard();
    Utils.showLoading();
    final isSuccess = await _useCase.registerService(
      ServiceRegistrationBody(
        facilityId: state.serviceType.id,
        facilityOptionId: state.locationTag.id,
        registrationDate: state.date,
        facilityGroupId: state.serviceGroup.id,
        note: noteCtrl.text,
      ),
    );
    Utils.hideLoading();

    if (isSuccess) {
      AppNavigator.pop(true);
    }
  }

  Future<List<RowItem<ServiceLocation>>> _getServiceLocation(AppLocalizations tr) async {
    final queries = ServiceLocationQueries(
      startTime: state.timeFrame.value!.startTime!,
      endTime: state.timeFrame.value!.endTime!,
      registrationDate: state.date,
    );

    final locationList = await _useCase.getServiceLocationList(state.serviceType.id!, queries);

    return locationList
        .map((e) => e.copyWith(
              isDisabled: e.value?.isMaxSlot == true,
              disabledReason: tr.full_slot,
            ))
        .toList();
  }
}
