import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/common_widget.dart';

final class BillStatus {
  static const String cancel = 'CANCEL';
  static const String paid = 'PAID';
  static const String unpaid = 'UNPAID';
  static const String partialPaid = 'PAID_PARTIAL';
}

class BillStatusTag extends BaseWidget {
  final String status;

  const BillStatusTag({Key? key, required this.status}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    return CommonWidget.badge(
      tr.bill_status(status),
      _getTextColor(theme, status),
      _getBgColor(theme, status),
    );
  }

  Color _getTextColor(AppTheme theme, String text) {
    switch (text) {
      case BillStatus.unpaid:
        return CommonWidget.badgeYellow(theme).textColor;
      case BillStatus.partialPaid:
        return CommonWidget.badgeBlue(theme).textColor;
      case BillStatus.paid:
        return CommonWidget.badgeGreen(theme).textColor;
      default:
        return CommonWidget.badgeDefault(theme).textColor;
    }
  }

  Color _getBgColor(AppTheme theme, String text) {
    switch (text) {
      case BillStatus.unpaid:
        return CommonWidget.badgeYellow(theme).bgColor;
      case BillStatus.partialPaid:
        return CommonWidget.badgeBlue(theme).bgColor;
      case BillStatus.paid:
        return CommonWidget.badgeGreen(theme).bgColor;
      default:
        return CommonWidget.badgeDefault(theme).bgColor;
    }
  }
}
