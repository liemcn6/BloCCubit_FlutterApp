import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/bottom_sheet_widget.dart';
import 'package:home_care/presentation/widgets/calendar.dart';
import 'package:home_care/presentation/widgets/custom_button.dart';

void showCalendarBottomSheet({
  required BuildContext context,
  required DateTime currentDay,
  DateTime? firstDay,
  DateTime? lastDay,
  required Function(DateTime data) onChange,
  Function(DateTime data)? onCloseChange,
  CupertinoDatePickerMode? mode,
  DateTime? initialDateTime,
  int interval = 1,
  String? title,
  bool showButtonClose = true,
  String? closeTitle,
}) async {
  return await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: DeviceUtils.getHeight3(context),
      minHeight: DeviceUtils.getHeight3(context) * 0.5,
    ),
    builder: (BuildContext context) {
      return CalendarBottomSheet(
        currentDay: currentDay,
        onChange: onChange,
        firstDay: firstDay,
        lastDay: lastDay,
        mode: mode,
        initialDateTime: initialDateTime,
        interval: interval,
        title: title,
        showButtonClose: showButtonClose,
        closeTitle: closeTitle,
        onCloseChange: onCloseChange,
      );
    },
  );
}

// ignore: must_be_immutable
class CalendarBottomSheet extends StatefulWidget {
  DateTime currentDay;
  DateTime? firstDay = DateTime(2010, 1, 1);
  DateTime? lastDay = DateTime(2040, 1, 1);
  Function(DateTime) onChange;
  Function(DateTime)? onCloseChange;
  CupertinoDatePickerMode? mode;
  DateTime? initialDateTime;
  int interval = 1;
  String? title;
  bool showButtonClose;
  String? closeTitle;

  CalendarBottomSheet({
    super.key,
    required this.currentDay,
    this.firstDay,
    this.lastDay,
    required this.onChange,
    this.mode,
    this.initialDateTime,
    this.interval = 1,
    this.title,
    this.showButtonClose = true,
    this.closeTitle,
    this.onCloseChange,
  });

  @override
  CalendarBottomSheetState createState() => CalendarBottomSheetState();
}

class CalendarBottomSheetState extends State<CalendarBottomSheet> {
  DateTime selected = DateTime.now();
  bool showMonth = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      selected = widget.currentDay;
      showMonth = widget.mode == CupertinoDatePickerMode.dateAndTime ||
          widget.mode == CupertinoDatePickerMode.time;
    });
  }

  void onChangeShowType(bool show) {
    setState(() {
      showMonth = show;
    });
  }

  Widget renderYearMonth(BuildContext context) {
    final controller = context.watch<AppCubit>();

    final appState = controller.state;
    final theme = appState.theme;
    return Container(
      constraints: BoxConstraints(
        maxHeight: DeviceUtils.getHeight3(context) / 3,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: CupertinoTheme(
        data: CupertinoThemeData(
          primaryColor: theme.colors.primary,
          primaryContrastingColor: theme.colors.primary,
        ),
        child: CupertinoDatePicker(
          initialDateTime: selected,
          minimumDate: widget.firstDay,
          maximumDate: widget.lastDay,
          // initialDateTime: widget.initialDateTime,
          use24hFormat: true,
          minuteInterval: widget.interval,
          key: const Key("cupertinoCalendar"),
          onDateTimeChanged: (DateTime newTime) {
            selected = newTime;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    final lang = Utils.languageOf(context);
    final appColors = controller.state.theme.colors;
    return BottomSheetWidget(
      title: widget.title ?? lang.pick_date,
      key: const Key("bottomSheetCalendar"),
      showIconClose: false,
      child: Column(
        children: [
          showMonth
              ? renderYearMonth(context)
              : CalendarWidget(
                  key: const Key("calendar"),
                  showFocusedDay: true,
                  disableSelectDate: true,
                  focusedDay: selected,
                  callbackOneDate: (selectedDay) {
                    setState(() {
                      selected = selectedDay;
                    });
                  },
                  onHeaderTapped: (date) {
                    setState(() {
                      showMonth = true;
                    });
                  },
                  firstDay: widget.firstDay,
                  lastDay: widget.lastDay,
                ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.showButtonClose
                  ? Flexible(
                      child: CustomButton(
                        onTap: () {
                          widget.onCloseChange!(selected);
                          Navigator.pop(context);
                        },
                        content: widget.closeTitle ?? lang.close,
                        margin: const EdgeInsets.fromLTRB(16, 8, 6, 16),
                        borderWidth: 1,
                        borderColor: appColors.neutral3,
                        color: appColors.white,
                        textColor: appColors.neutral10,
                      ),
                    )
                  : const SizedBox.shrink(),
              Flexible(
                child: CustomButton(
                  onTap: () {
                    widget.onChange(selected);
                    Navigator.pop(context);
                  },
                  content: lang.select,
                  margin: const EdgeInsets.fromLTRB(6, 8, 16, 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
