import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/common_widget.dart';

import '../../../../domain/entities/vehicle/vehicle_list.dart';

extension VehicleHistoryEx on VehicleApprovalStatus {
  static Widget getStatusWidget(
      AppTheme theme, AppLocalizations lang, VehicleApprovalStatus status) {
    BadgeColor badgeColor = getBadgeColor(theme, status);

    return CommonWidget.badge(
        lang.vehicle_history_name(status.value), badgeColor.textColor, badgeColor.bgColor);
  }

  static BadgeColor getBadgeColor(AppTheme theme, VehicleApprovalStatus status) {
    switch (status) {
      case VehicleApprovalStatus.approved:
        return CommonWidget.badgeGreen(theme);
      case VehicleApprovalStatus.waitApprove:
        return CommonWidget.badgeYellow(theme);
      case VehicleApprovalStatus.neW:
        return CommonWidget.badgeDefault(theme);
      default:
        return CommonWidget.badgeDefault(theme);
    }
  }
}
