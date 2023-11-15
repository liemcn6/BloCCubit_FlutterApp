import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/presentation/modules/vehicle/enum/vehicle_type.dart';
import 'package:home_care/presentation/modules/vehicle/widgets/vehicle_info_item.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/dialog_custom.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/loading_wrapper.dart';
import 'package:home_care/presentation/widgets/select_widget.dart';
import 'package:home_care/presentation/widgets/slideable_action_custom_widget.dart';

import '../cubit/vehicle_register_cubit.dart';

class VehicleRegisterView extends BaseWidget {
  final String? id;
  const VehicleRegisterView({
    super.key,
    this.id,
  });

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VehicleRegisterCubit>().init(id: id);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<VehicleRegisterCubit>();
    final state = cubit.state;

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.create_a_parking_application,
          visibleBack: true,
          onPressed: () {
            AppNavigator.pop();
          },
        ),
      ),
      body: LoadingWrapper(
        isLoaded: state.isLoaded,
        child: Padding(
          padding: const EdgeInsets.only(
            top: Dimension.padding16,
            left: Dimension.padding16,
            right: Dimension.padding16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Info
              Text(
                tr.registration_info,
                style: AppTextStyle.s16w600.copyWith(
                  color: theme.colors.neutral13,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(Dimension.h16),
              SelectWidget(
                title: tr.registration_user,
                value: state.userFullName,
                isDisable: true,
                icon: const SizedBox.shrink(),
              ),
              // const Gap(Dimension.h4),
              // Text(
              //   state.userAddress,
              //   style: AppTextStyle.s12w400.copyWith(
              //     color: theme.colors.neutral13,
              //   ),
              //   overflow: TextOverflow.ellipsis,
              // ),
              const Gap(Dimension.h16),

              SelectWidget(
                title: tr.building,
                value: state.building.name,
                onTap: () => cubit.chooseBuilding(context),
              ),

              const Gap(Dimension.h16),

              SelectWidget(
                title: tr.registration_period,
                value: DateTimeUtils.formatDateTime(
                  cubit.state.selectedDate.millisecondsSinceEpoch,
                  DateTimeUtils.MM_yyyy,
                ),
                onTap: () => cubit.showDatePicker(context),
              ),

              const Gap(Dimension.h24),

              ///vehicle information
              Text(
                tr.vehicle_information,
                style: AppTextStyle.s16w600.copyWith(
                  color: theme.colors.neutral13,
                ),
                overflow: TextOverflow.ellipsis,
              ),

              const Gap(Dimension.h16),

              /// List
              Expanded(
                child: Column(
                  children: [
                    Column(
                      children: [
                        _itemAdd(theme, tr, cubit: cubit),
                        const SizedBox(
                          height: Dimension.h16,
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.vehicleCreateList.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Slidable(
                              // key: ValueKey(item.id),
                              endActionPane: ActionPane(
                                extentRatio: 0.15,
                                motion: const DrawerMotion(),
                                children: [
                                  //delete icon slieable
                                  SlidableActionWidget(
                                    onPressed: (context) {
                                      cubit.deleteVehicle(index);
                                    },
                                    backgroundColor: theme.colors.red,
                                    foregroundColor: theme.colors.white,
                                    icon: AppSvgs.icDelete,
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                              child: VehicleInfoItem(
                                controlPlate: state.vehicleCreateList[index].licensePlate,
                                type: VehicleType.fromCode(
                                    state.vehicleCreateList[index].vehicleTypeCode ?? ''),
                                onTapItem: () async {
                                  final VehicleRouteResult? data =
                                      await AppNavigator.push(Routes.vehicleEditInfo, {
                                    "vehicleCreate": state.vehicleCreateList[index],
                                    "buildingId": state.building.id,
                                  });

                                  if (data?.isDelete == true) {
                                    cubit.deleteVehicle(index);
                                    return;
                                  }

                                  if (data?.vehicleCreate != null) {
                                    cubit.editVehicle(data!.vehicleCreate!, index);
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: Dimension.h16,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Button
              _buttons(context, tr, theme, cubit: cubit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemAdd(
    AppTheme theme,
    AppLocalizations tr, {
    required VehicleRegisterCubit cubit,
  }) {
    return InkWell(
      onTap: () async {
        final VehicleRouteResult? data = await AppNavigator.push(
          Routes.vehicleAddInfo,
          {"buildingId": cubit.state.building.id ?? ""},
        );

        if (data?.vehicleCreate != null) {
          cubit.addVehicle(data!.vehicleCreate!);
        }
      },
      child: Container(
        height: Dimension.h46,
        decoration: BoxDecoration(
          color: theme.colors.white,
          borderRadius: BorderRadius.circular(
            Dimension.radius8,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimension.padding16,
          vertical: Dimension.padding12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Dimension.h40,
              height: Dimension.h40,
              child: Icon(Icons.add, color: theme.colors.neutral10),
            ),
            const SizedBox(width: Dimension.h16),
            Text(
              tr.add_vehicle_information,
              style: AppTextStyle.s14w600.copyWith(color: theme.colors.neutral10),
            ),
          ],
        ),
      ),
    );
  }

  /// Buttons()
  Widget _buttons(
    BuildContext context,
    AppLocalizations tr,
    AppTheme theme, {
    required VehicleRegisterCubit cubit,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardView(
          height: Dimension.h44,
          title: tr.submit_registration,
          color: theme.colors.primary,
          titleStyle: AppTextStyle.s14w600.copyWith(
            color: theme.colors.white,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.padding12,
          ),
          margin: EdgeInsets.zero,
          radius: Dimension.radius8,
          border: Border.all(color: theme.colors.border),
          onTap: () async {
            final isSuccess = await cubit.requestRegisterVehicle();

            if (isSuccess && context.mounted) {
              showPopUpSuccess(context, tr, cubit);
            }
          },
          disable: !cubit.state.isValid,
        ),
        const SizedBox(
          height: Dimension.h8,
        ),
        Row(
          children: [
            Expanded(
              child: CardView(
                height: Dimension.h44,
                title: tr.cancel,
                color: theme.colors.white,
                titleStyle: AppTextStyle.s14w600.copyWith(
                  color: theme.colors.neutral10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimension.padding12,
                ),
                margin: EdgeInsets.zero,
                radius: Dimension.radius8,
                border: Border.all(color: theme.colors.border),
                onTap: () {
                  AppNavigator.pop();
                },
              ),
            ),
            const Gap(Dimension.h8),
            Expanded(
              child: CardView(
                disable: cubit.state.disableTempleSave,
                height: Dimension.h44,
                title: tr.temple_save,
                color: theme.colors.white,
                titleStyle: AppTextStyle.s14w600.copyWith(
                  color: theme.colors.neutral10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimension.padding12,
                ),
                margin: EdgeInsets.zero,
                radius: Dimension.radius8,
                border: Border.all(color: theme.colors.border),
                onTap: () async {
                  final result = await cubit.onTapTempleSave();
                  if (result) {
                    if (!context.mounted) return;
                    WidgetUtils.showPopUpSuccess(
                      context: context,
                      content: tr.evaluation_save_draft,
                      showButtonNo: false,
                      titleButtonYes: tr.close,
                      onTapYes: () {
                        Navigator.pop(context);
                        AppNavigator.pop(true);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: Dimension.h8,
        ),
      ],
    );
  }

  /// show popUp
  void showPopUp(BuildContext context, AppTheme theme, AppLocalizations lang) {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) => DialogCustom(
            colorTitle: theme.colors.red,
            colorButtonAccept: theme.colors.primary,
            textBtnAccept: lang.confirm,
            showBtnCancel: true,
            textBtnCancel: lang.back,
            title: lang.notify,
            content: lang.are_you_sure_you_want_to_delete_this_vehicle_information,
            onPressBtnAccept: () async {},
            onPressBtnCancel: () => {Navigator.of(dialogContext).pop()}));
  }

  void showPopUpSuccess(BuildContext context, AppLocalizations t, VehicleRegisterCubit cubit) {
    WidgetUtils.showPopUpSuccess(
      context: context,
      content: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
                text: t.parking_registration_application,
                style: AppTextStyle.s14w400.copyWith(color: Colors.black)),
            TextSpan(
              text: '${t.term} ${DateTimeUtils.formatDateTime(
                cubit.state.selectedDate.millisecondsSinceEpoch,
                DateTimeUtils.MM_yyyy,
              )}',
              style: AppTextStyle.s14wBoldBlack,
            ),
            TextSpan(
                text: t.send_parking_success,
                style: AppTextStyle.s14w400.copyWith(color: Colors.black)),
          ],
        ),
      ),
      titleButtonYes: t.btn_close,
      title: t.registerSuccess,
      showButtonNo: false,
      onTapYes: () {
        Navigator.pop(context);
        AppNavigator.pop(true);
      },
    );
  }
}

class VehicleRouteResult {
  final VehicleCreate? vehicleCreate;
  final bool? isDelete;

  VehicleRouteResult({
    this.vehicleCreate,
    this.isDelete,
  });
}
