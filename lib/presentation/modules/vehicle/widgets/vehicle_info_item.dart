import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/vehicle/enum/vehicle_type.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

import '../../../../domain/entities/vehicle/vehicle_list.dart';

class VehicleInfoItem extends BaseWidget {
  final String? controlPlate;
  final VehicleType? type;
  final String? registrationDate;
  final String? dateWhenFeesStart;
  final String? fee;
  final VehicleStatus? status;
  final VoidCallback? onTapItem;

  const VehicleInfoItem({
    super.key,
    this.registrationDate,
    this.dateWhenFeesStart,
    this.status,
    this.controlPlate,
    this.fee,
    this.type,
    this.onTapItem,
  });

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    return InkWell(
      onTap: () {
        onTapItem?.call();
      },
      child: Container(
        height: Dimension.h68,
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
              child: VehicleType.getIcon(type ?? VehicleType.unknown),
            ),
            const SizedBox(width: Dimension.h16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controlPlate ?? '- -',
                  style: AppTextStyle.s14w600.copyWith(color: theme.colors.neutral13),
                ),
                const SizedBox(
                  height: Dimension.h4,
                ),
                Text(
                  tr.vehicle_type_name(type?.value ?? ""),
                  style: AppTextStyle.s14w400.copyWith(
                    color: theme.colors.neutral10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
