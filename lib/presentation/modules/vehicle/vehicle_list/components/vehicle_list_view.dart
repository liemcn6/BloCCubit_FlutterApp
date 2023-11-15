import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_history.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_list/cubit/vehicle_list_cubit.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_list/cubit/vehicle_list_state.dart';
import 'package:home_care/presentation/modules/vehicle/widgets/vehicle_history_item.dart';
import 'package:home_care/presentation/modules/vehicle/widgets/vehicle_registered_item.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/common_widget.dart';

import '../../../../../domain/entities/vehicle/vehicle_list.dart';
import '../../../../widgets/loading_wrapper.dart';

class VehicleListView extends BaseWidget {
  const VehicleListView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VehicleListCubit>().getInit(context: context);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<VehicleListCubit>();
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Column(
        children: [
          _header(theme, tr),
          Row(
            children: [
              Expanded(flex: 1, child: _tab(cubit, theme, tr, TabType.registered)),
              Expanded(flex: 1, child: _tab(cubit, theme, tr, TabType.history)),
            ],
          ),
          BlocBuilder<VehicleListCubit, VehicleListState>(
            builder: (context, state) => Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LoadingWrapper(
                    isLoaded: state.isLoaded,
                    child: Column(
                      children: state.type == TabType.registered
                          ? _registered(theme, tr, state.vehicleList)
                          : _history(context, cubit, theme, tr, state.vehicleHistory),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: AppStorage().authorities.permissions?.isParkingRegistrationCreate ?? false,
        child: _registerButton(theme, cubit, context: context),
      ),
    );
  }

  _registered(AppTheme theme, AppLocalizations t, VehicleList vehicleList) {
    return (vehicleList.data.isEmpty)
        ? [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSvgs.icEmpty,
                const SizedBox(height: 16),
                Text(t.noData, style: AppTextStyle.s16wBoldEmptyL),
              ],
            ),
          ]
        : vehicleList.data
            .map<Widget>((item) => VehicleRegisteredItem(
                  controlPlate: item.licensePlate,
                  startDate: DateTimeUtils.convertDate(item.startDate),
                  price: StringUtils.formatStringToCash(cash: item.unitPrice),
                  registrationDate: DateTimeUtils.convertDate(item.registrationDate),
                  type: item.type,
                  status: item.status,
                  onTapItem: () {
                    AppNavigator.push(Routes.vehicleDetail, item.id);
                  },
                ))
            .toList();
  }

  ///registration_history
  _history(BuildContext context, VehicleListCubit cubit, AppTheme theme, AppLocalizations t,
      VehicleHistory vehicleHistory) {
    return (vehicleHistory.data.isEmpty)
        ? [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSvgs.icEmpty,
                const SizedBox(height: 16),
                Text(t.noData, style: AppTextStyle.s16wBoldEmptyL),
              ],
            ),
          ]
        : vehicleHistory.data
            .map<Widget>((item) => VehicleHistoryItem(
                  organizationName: item.organizationName,
                  buildingName: item.buildingName,
                  approvalStatus: item.approvalStatus,
                  period: item.period,
                  countBike: item.countBike,
                  countMotorbike: item.countMotorbike,
                  countCar: item.countCar,
                  onTapItem: () async {
                    bool result = false;
                    if (item.approvalStatus == VehicleApprovalStatus.neW) {
                      result = await AppNavigator.push(Routes.vehicleRegister, item.id);
                    } else {
                      result = await AppNavigator.push(Routes.vehicleDetailHistory, item.id);
                    }

                    if (result) {
                      await cubit.getInit(context: context);
                    }
                  },
                ))
            .toList();
  }

  _tab(VehicleListCubit cubit, AppTheme theme, AppLocalizations t, TabType tabType) {
    return GestureDetector(
      onTap: () => cubit.switchTab(tabType),
      behavior: HitTestBehavior.opaque,
      child: BlocBuilder<VehicleListCubit, VehicleListState>(
        builder: (context, state) {
          return Container(
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color: state.type == tabType ? theme.colors.green8 : Colors.white,
                ),
              ),
            ),
            child: Center(
              child: Text(
                tabType == TabType.registered ? t.vehicle_registration : t.registration_history,
                style: AppTextStyle.s14w400cBlack.copyWith(
                  fontWeight: FontWeight.w600,
                  color: state.type == tabType ? theme.colors.green8 : theme.colors.neutral13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _header(AppTheme theme, AppLocalizations t) {
    return Stack(
      children: [
        const Image(
          image: AppImages.bgTransportManagement,
          fit: BoxFit.fitWidth,
        ),
        SafeArea(
          child: CommonWidget.iconBack323E44(),
        ),
        Positioned.fill(
          bottom: 24,
          left: 16,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              t.vehicle_management,
              style: AppTextStyle.s24w400cBlack
                  .copyWith(fontWeight: FontWeight.w600, color: theme.colors.textTitle),
            ),
          ),
        )
      ],
    );
  }

  Widget _registerButton(
    AppTheme theme,
    VehicleListCubit cubit, {
    required BuildContext context,
  }) {
    return BlocBuilder<VehicleListCubit, VehicleListState>(
      builder: (context, state) {
        return Visibility(
          visible: state.type != TabType.registered,
          child: FloatingActionButton(
            backgroundColor: theme.colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onPressed: () async {
              final bool? isCreateSuccess = await AppNavigator.push(Routes.vehicleRegister);

              if (isCreateSuccess == true) {
                cubit.switchTab(TabType.history);
              }

              if (context.mounted) await cubit.getInit(context: context);
            },
            child: Icon(
              Icons.add,
              color: theme.colors.white,
            ),
          ),
        );
      },
    );
  }
}
