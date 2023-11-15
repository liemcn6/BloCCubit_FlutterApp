import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final List<DataSelectDate>? dataSelectDate;
  final List<DataDisable>? dataDisable;
  final bool? checkToday;
  final bool? disableSelectDate;
  final Function(Set<DateTime>)? callbackSelectDate;
  final Function(DateTime)? callbackOneDate;
  final DateTime focusedDay;
  final bool? showFocusedDay;
  final DateTime? firstDay;
  final DateTime? lastDay;
  final Function(DateTime)? onHeaderTapped;

  const CalendarWidget({
    Key? key,
    this.dataSelectDate,
    this.dataDisable,
    this.checkToday = true,
    this.callbackSelectDate,
    this.callbackOneDate,
    required this.focusedDay,
    this.showFocusedDay = false,
    this.disableSelectDate = false,
    this.firstDay,
    this.lastDay,
    this.onHeaderTapped,
  }) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _focusedDay = widget.showFocusedDay == false ? DateTime.now() : widget.focusedDay;
  DateTime? _selectedDay;
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: (DateTime key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    },
  );
  late bool _checkToday = widget.checkToday ?? true;

  @override
  void initState() {
    super.initState();
    if (_checkToday == true) {
      _selectedDays.add(_focusedDay);
      setState(() {
        _focusedDay = widget.focusedDay;
        _selectedDay = widget.focusedDay;
      });
    }
    if (widget.dataSelectDate != null) selectData();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      // _focusedDay = focusedDay;
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
        widget.callbackSelectDate!(_selectedDays);
      } else {
        _selectedDays.add(selectedDay);
        widget.callbackSelectDate!(_selectedDays);

        if (_focusedDay == selectedDay) {
          setState(() {
            _checkToday = true;
          });
        }
      }
    });
  }

  selectData() {
    widget.dataSelectDate?.map((data) => _selectedDays.add(DateTime.parse(data.date))).toList();
  }

  void _onDaySelectedOne(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      if (_focusedDay == selectedDay) {
        setState(() {
          _checkToday = true;
        });
      }
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = selectedDay;
      });
      widget.callbackOneDate!(selectedDay);
    }
  }

  handleWeek(context, day, AppColors colors) {
    if (day.weekday == DateTime.sunday) {
      final text = DateFormat.E().format(day);
      return Center(
        child: Text(
          text[0],
          style:
              TextStyle(color: colors.calendarWeekGray, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      );
    }
    if (day.weekday == DateTime.monday) {
      final text = DateFormat.E().format(day);
      return Center(
        child: Text(
          text[0],
          style:
              TextStyle(color: colors.calendarWeekGray, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      );
    }
    if (day.weekday == DateTime.tuesday) {
      final text = DateFormat.E().format(day);
      return Center(
        child: Text(
          text[0],
          style:
              TextStyle(color: colors.calendarWeekGray, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      );
    }
    if (day.weekday == DateTime.wednesday) {
      final text = DateFormat.E().format(day);
      return Center(
        child: Text(
          text[0],
          style:
              TextStyle(color: colors.calendarWeekGray, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      );
    }
    if (day.weekday == DateTime.thursday) {
      final text = DateFormat.E().format(day);
      return Center(
        child: Text(
          text[0],
          style:
              TextStyle(color: colors.calendarWeekGray, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      );
    }
    if (day.weekday == DateTime.saturday) {
      final text = DateFormat.E().format(day);
      return Center(
        child: Text(
          text[0],
          style:
              TextStyle(color: colors.calendarWeekGray, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      );
    }
    if (day.weekday == DateTime.friday) {
      final text = DateFormat.E().format(day);
      return Center(
        child: Text(
          text[0],
          style:
              TextStyle(color: colors.calendarWeekGray, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      );
    }
  }

  Widget toDay(context, date, event) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: _checkToday == true
                ? AppColors.light().primary.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            date.day.toString(),
            style: TextStyle(
                color: _checkToday == true ? Colors.white : const Color(0xFF444444),
                fontWeight: FontWeight.w600,
                fontSize: _checkToday == true ? 14 : 16),
          ),
        ),
      );

  Widget dayDefault(context, datetime, focusedDay, AppColors colors) => Container(
        width: 40,
        height: 40,
        decoration:
            BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            datetime.day.toString(),
            style: TextStyle(color: colors.textBody, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
      );

  Widget selectDay(context, datetime, focusedDay) {
    if (widget.disableSelectDate == false) {
      final selectedDay =
          datetime.day.toString() + datetime.month.toString() + datetime.year.toString();
      Color? handleColor() {
        Color? colors;
        if (widget.dataSelectDate != null) {
          for (int a = 0; a < widget.dataSelectDate!.length; a++) {
            var dateDay = DateTime.parse(widget.dataSelectDate![a].date).day.toString() +
                DateTime.parse(widget.dataSelectDate![a].date).month.toString() +
                DateTime.parse(widget.dataSelectDate![a].date).year.toString();
            if (selectedDay == dateDay) {
              // switch (dataDate[a].type) {
              //   case "Chấp nhận":
              //     {
              //       colors = const Color(0xFF00B69B);
              //     }
              //     break;
              //   case "Từ chối":
              //     {
              //       colors = const Color(0xFFEB2D4B);
              //     }
              //     break;
              //   case "Chờ xử lý":
              //     {
              //       colors = const Color(0xFFB2B8ED);
              //     }
              //     break;
              //   case "Huỷ":
              //     {
              //       colors = const Color(0xFFD9D9D9);
              //     }
              //     break;
              //   default:
              //     {
              //       colors = const Color(0xFF177DDF);
              //     }
              //     break;
              // }
            }
          }
        }

        return colors;
      }

      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: handleColor() ?? const Color(0xFF39A07C),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            datetime.day.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    }
    return Container(
      width: 40,
      height: 40,
      decoration:
          BoxDecoration(color: const Color(0xFF39A07C), borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          datetime.day.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget disableDay(context, datetime, focusedDay) => Container(
        width: 40,
        height: 40,
        decoration:
            BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(50.0)),
        child: Center(
          child: Text(
            datetime.day.toString(),
            style: const TextStyle(
              color: Color(0xFFDDDDDD),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );

  Widget outSiteDay(context, datetime, focusedDay) => Container(
        width: 40,
        height: 40,
        decoration:
            BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            datetime.day.toString(),
            style: const TextStyle(
              color: Color(0xFF444444),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );

  handleTitleCalender(date, locale) {
    return "Tháng ${int.parse(DateFormat.M(locale).format(date)) <= 9 ? '0' : ''}${DateFormat.M(locale).format(date)} - ${DateFormat.y(locale).format(date)}";
  }

  handleEnabledDay(date) {
    bool checkDate = true;
    String dateDay = date.day.toString() + date.month.toString() + date.year.toString();
    if (widget.dataDisable != null) {
      for (int i = 0; i < widget.dataDisable!.length; i++) {
        String disable = DateTime.parse(widget.dataDisable![i].date).day.toString() +
            DateTime.parse(widget.dataDisable![i].date).month.toString() +
            DateTime.parse(widget.dataDisable![i].date).year.toString();
        if (dateDay == disable) {
          checkDate = false;
          break;
        }
      }
    }
    return checkDate;
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    // final lang = Utils.languageOf(context);
    final appColors = controller.state.theme.colors;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: TableCalendar(
          locale: Localizations.localeOf(context).languageCode,
          rowHeight: 44,
          daysOfWeekHeight: 22,
          onHeaderTapped: widget.onHeaderTapped,
          headerStyle: HeaderStyle(
            titleCentered: true,
            titleTextFormatter: (date, locale) => handleTitleCalender(date, locale),
            titleTextStyle:
                TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: appColors.textTitle),
            leftChevronVisible: true,
            rightChevronVisible: true,
            headerMargin: const EdgeInsets.symmetric(vertical: 17.0),
            leftChevronPadding: EdgeInsets.zero,
            rightChevronPadding: EdgeInsets.zero,
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: appColors.colorBlackIcon,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: appColors.colorBlackIcon,
            ),
            formatButtonVisible: false,
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: appColors.primary.withOpacity(0.16),
              shape: BoxShape.circle,
            ),
            rangeEndDecoration: BoxDecoration(
              color: appColors.primary.withOpacity(0.16),
              shape: BoxShape.circle,
            ),
          ),
          firstDay: widget.firstDay ?? DateTime.utc(1900, 10, 16),
          lastDay: widget.lastDay ?? DateTime.utc(2100, 3, 14),

          focusedDay: _focusedDay,
          // widget.showFocusedDay == false ? _focusedDay : widget.focusedDay,
          calendarFormat: _calendarFormat,
          // enabledDayPredicate: (date) => handleEnabledDay(date),
          selectedDayPredicate: (day) => widget.disableSelectDate == false
              ? _selectedDays.contains(day)
              : isSameDay(_selectedDay, day),
          onDaySelected: widget.disableSelectDate == false ? _onDaySelected : _onDaySelectedOne,
          // Funtion onclick top in open week
          // onFormatChanged: (format) {
          //   if (_calendarFormat != format) {
          //     setState(() {
          //       _calendarFormat = format;
          //     });
          //   }
          // },
          // onPageChanged: (focusedDay) {
          //   _focusedDay = focusedDay;
          // },
          // calendarStyle: const CalendarStyle(
          //     todayDecoration: BoxDecoration(color: Colors.red),
          //     todayTextStyle:
          //         TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16)),
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) => handleWeek(context, day, appColors),
            todayBuilder: (context, date, event) => toDay(context, date, event),
            defaultBuilder: (context, datetime, focusedDay) =>
                dayDefault(context, datetime, focusedDay, appColors),
            selectedBuilder: (context, datetime, focusedDay) =>
                selectDay(context, datetime, focusedDay),
            disabledBuilder: (context, datetime, focusedDay) =>
                disableDay(context, datetime, focusedDay),
            outsideBuilder: (context, datetime, focusedDay) =>
                outSiteDay(context, datetime, focusedDay),
          ),
        ),
      ),
    );
  }
}

class DataSelectDate {
  final String date, type;

  DataSelectDate({
    required this.date,
    required this.type,
  });
}

class DataDisable {
  final String date;

  DataDisable({
    required this.date,
  });
}
