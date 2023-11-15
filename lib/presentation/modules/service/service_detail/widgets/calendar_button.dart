import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/calendar_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarButton extends StatelessWidget {
  final AppTheme theme;
  final AppLocalizations tr;
  final ValueChanged<DateTime>? callBackDateTime;
  final DateTime? currentDay;

  const CalendarButton({
    super.key,
    required this.theme,
    required this.tr,
    this.callBackDateTime,
    this.currentDay,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCalendarBottomSheet(
          context: context,
          currentDay: currentDay ?? DateTime.now(),
          onChange: (DateTime data) {
            callBackDateTime?.call(data);
          },
          title: tr.select_registration_date,
          firstDay: DateTime.now(),
        );
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: (MediaQuery.of(context).size.width - Dimension.h64) / 5,
          minHeight: Dimension.h56,
          maxHeight: Dimension.h62,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.radius8),
          border: Border.all(
            color: theme.colors.neutral3,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: Dimension.h20,
            height: Dimension.h20,
            child: AppSvgs.icChevronForward,
          ),
        ),
      ),
    );
  }
}
