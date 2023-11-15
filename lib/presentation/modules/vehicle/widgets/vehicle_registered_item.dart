import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/vehicle/enum/registration_status.dart';
import 'package:home_care/presentation/modules/vehicle/enum/vehicle_type.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

import '../../../../domain/entities/vehicle/vehicle_list.dart';

class VehicleRegisteredItem extends BaseWidget {
  final String controlPlate;
  final VehicleType type;
  final String registrationDate;
  final String startDate;
  final String price;
  final VehicleStatus status;
  final VoidCallback onTapItem;

  const VehicleRegisteredItem(
      {super.key,
      required this.controlPlate,
      required this.type,
      required this.registrationDate,
      required this.startDate,
      required this.price,
      required this.status,
      required this.onTapItem});

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          Dimension.radius8,
        ),
        onTap: () {
          onTapItem.call();
        },
        child: Ink(
          height: 140,
          decoration: BoxDecoration(
            color: theme.colors.white,
            borderRadius: BorderRadius.circular(
              Dimension.radius8,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.padding16,
            vertical: Dimension.padding16,
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controlPlate,
                          style: AppTextStyle.s16w600.copyWith(color: theme.colors.neutral13),
                        ),
                        const SizedBox(
                          height: Dimension.h4,
                        ),
                        Text(
                          tr.vehicle_type_name(type.value),
                          style: AppTextStyle.s12w400.copyWith(
                            color: theme.colors.neutral13,
                          ),
                        ),
                      ],
                    ),
                    RegistrationStatusExS.getStatusWidget(theme, tr, status)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VehicleType.getIcon(type),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${tr.dayRegister} : $registrationDate",
                          style: AppTextStyle.s12w400.copyWith(
                            color: theme.colors.neutral13,
                          ),
                        ),
                        Text(
                          "${tr.start_charging} : $startDate",
                          style: AppTextStyle.s12w400.copyWith(
                            color: theme.colors.neutral13,
                          ),
                        ),
                        Text(
                          "${tr.fee} : $price/${tr.month}",
                          style: AppTextStyle.s12w400.copyWith(
                            color: theme.colors.neutral13,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
