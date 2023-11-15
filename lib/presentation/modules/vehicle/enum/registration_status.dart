import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/common_widget.dart';

import '../../../../domain/entities/vehicle/vehicle_list.dart';

extension RegistrationStatusExS on VehicleStatus {
  static Widget getStatusWidget(AppTheme theme, AppLocalizations lang, VehicleStatus? status) {
    BadgeColor badgeColor = getBadgeColor(theme, status);

    return CommonWidget.badge(
        lang.registration_status(status?.value ?? ""), badgeColor.textColor, badgeColor.bgColor);
  }

  static VehicleStatus? getEnumByString({String? value}) {
    switch (value) {
      case "ACTIVE":
        return VehicleStatus.active;
      case "INACTIVE":
        return VehicleStatus.inactive;
      default:
        return null;
    }
  }

  static BadgeColor getBadgeColor(AppTheme theme, VehicleStatus? status) {
    switch (status) {
      case VehicleStatus.active:
        return CommonWidget.badgeBlue(theme);
      case VehicleStatus.pending:
        return CommonWidget.badgeYellow(theme);
      case VehicleStatus.inactive:
        return CommonWidget.badgeDefault(theme);
      default:
        return CommonWidget.badgeUnknown();
    }
  }
}
