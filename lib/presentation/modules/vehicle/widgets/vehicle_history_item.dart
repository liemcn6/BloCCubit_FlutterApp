import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/vehicle/enum/vehicle_history_status.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

import '../../../../domain/entities/vehicle/vehicle_list.dart';

class VehicleHistoryItem extends BaseWidget {
  final String organizationName;
  final String buildingName;
  final VehicleApprovalStatus approvalStatus;
  final String period;
  final int countBike;
  final int countMotorbike;
  final int countCar;
  final VoidCallback onTapItem;

  const VehicleHistoryItem(
      {super.key,
      required this.organizationName,
      required this.buildingName,
      required this.approvalStatus,
      required this.period,
      required this.countBike,
      required this.countMotorbike,
      required this.countCar,
      required this.onTapItem});

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimension.radius8),
        onTap: () {
          onTapItem.call();
        },
        child: Ink(
          decoration: BoxDecoration(
            color: theme.colors.white,
            borderRadius: BorderRadius.circular(Dimension.radius8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.padding16,
            vertical: Dimension.padding16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Datetime - status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${tr.period} $period',
                    style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral13),
                  ),
                  VehicleHistoryEx.getStatusWidget(theme, tr, approvalStatus)
                ],
              ),
              const SizedBox(height: 16),

              /// title - content
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      organizationName,
                      style: AppTextStyle.s16w600.copyWith(color: theme.colors.neutral13),
                    ),
                    Text(
                      buildingName,
                      style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              /// icon - count
              Padding(
                padding: const EdgeInsets.only(top: Dimension.padding16),
                child: Center(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //car
                        Visibility(
                          visible: countCar > 0,
                          child: Row(
                            children: [
                              SizedBox(
                                height: Dimension.h20,
                                width: Dimension.h20,
                                child: AppSvgs.icCarNeutral13,
                              ),
                              const SizedBox(width: Dimension.h4),
                              Text(
                                "${tr.car} : ",
                                style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral13),
                              ),
                              Text(
                                "$countCar",
                                style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral13),
                              ),
                              const VerticalDivider(),
                            ],
                          ),
                        ),
                        //motorbike
                        Visibility(
                          visible: countMotorbike > 0,
                          child: Row(
                            children: [
                              SizedBox(
                                height: Dimension.h20,
                                width: Dimension.h20,
                                child: AppSvgs.icMotobikeNeutral13,
                              ),
                              const SizedBox(width: Dimension.h4),
                              Text(
                                "${tr.motorbike} : ",
                                style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral13),
                              ),
                              Text(
                                "$countMotorbike",
                                style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral13),
                              ),
                              const VerticalDivider(),
                            ],
                          ),
                        ),
                        //bike
                        Visibility(
                          visible: countBike > 0,
                          child: Row(
                            children: [
                              SizedBox(
                                height: Dimension.h20,
                                width: Dimension.h20,
                                child: AppSvgs.icBikeNeutral13,
                              ),
                              const SizedBox(width: Dimension.h4),
                              Text(
                                "${tr.bike} : ",
                                style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral13),
                              ),
                              Text(
                                "$countBike",
                                style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral13),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
