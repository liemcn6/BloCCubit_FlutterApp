part of '../core.dart';

class DateTimeUtils {
  // 'HH:mm, dd/MM/yyyy'
  static const String HH_mm_dd_MM_yyyy = 'HH:mm, dd/MM/yyyy';

  //'HH:mm:ss - dd/MM/yyyy'
  static const String HH_mm_ss_dd_MM_yyyy = 'HH:mm:ss - dd/MM/yyyy';

  // 'dd/MM/yyyy'
  static const String dd_MM_yyyy = 'dd/MM/yyyy';

  // 'HH:mm'
  static const String HH_mm = 'HH:mm';

  // 'MM/yyyy'
  static const String MM_yyyy = 'MM/yyyy';

  static String? formatDateTime(int? time, String s) {
    if (time == null) return null;

    final date = DateTime.fromMillisecondsSinceEpoch(time);

    return DateFormat(s).format(date);
  }

  static String convertDateReverse(String? date) {
    const String formatDate = 'dd/MM/yyyy';
    const String formatDateApi = 'yyyy-MM-dd';

    if (date != null && date.isNotEmpty) {
      DateTime dateTime = DateFormat(formatDate).parse(date);
      var inputDate = DateTime.parse(dateTime.toString());
      var outputFormat = DateFormat(formatDateApi);
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    } else {
      return '';
    }
  }

  static formatTime({required int time}) {
    int sec = time % 60;
    int min = (time / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return " $minute:$second";
  }

  static secondsToDate(int time) {
    var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return DateFormat('HH:mm - dd/MM/yyyy').format(date); // 31/12/2000, 22:00
  }

  static timePrint() {
    DateTime now = DateTime.now();
    return '${now.hour}:${now.minute}:${now.second}.${now.millisecond}';
  }

  static String timeStampToTime(int? time) {
    String formatTime = 'HH:mm';

    return formatDateTime(time, formatTime) ?? '';
  }

  static String timeStampToDate(int? time) {
    String formatDate = 'dd/MM/yyyy';

    return formatDateTime(time, formatDate) ?? '';
  }

  static String convertDate(date, [format]) {
    String formatDate = 'dd/MM/yyyy';
    if (format != null) {
      formatDate = format;
    }

    if (date is String && date.isNotEmpty) {
      DateTime dateTime = DateTime.parse(date);
      return formatDateTime(dateTime.millisecondsSinceEpoch, formatDate) ?? '';
    } else if (date is DateTime) {
      return formatDateTime(date.millisecondsSinceEpoch, formatDate) ?? '';
    } else {
      return '';
    }
  }

  static String fomatHourDateMonth(int? millis) {
// 12 Hour format:
    return DateFormat('HH:mm, dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(millis!));
  }

  static List<RowItem> getMonthList() {
    List<RowItem> list = [];
    for (int i = 1; i <= 12; i++) {
      list.add(RowItem(
        id: i.toString(),
        name: DateTimeUtils.formatDateTime(
          DateTime(DateTime.now().year, i).millisecondsSinceEpoch,
          'MM/yyyy',
        ),
        value: DateTime(DateTime.now().year, i),
      ));
    }
    return list;
  }

  static String convertMillisecondsToHours(
    int? millis, {
    bool isShowSecond = false,
  }) {
    if (millis != null) {
      final int hour = (millis / 3600000).floor();
      final int minute = ((millis % 3600000) / 60000).floor();
      final int second = ((millis % 3600000) % 60000 / 1000).floor();

      final String hourStr = hour < 10 ? '0$hour' : '$hour';
      final String minuteStr = minute < 10 ? '0$minute' : '$minute';
      final String secondStr = second < 10 ? '0$second' : '$second';

      if (isShowSecond) {
        return '$hourStr:$minuteStr:$secondStr';
      } else {
        return '$hourStr:$minuteStr';
      }
    }
    return '- -';
  }

  static String convertDateInit(String? date) {
    const String formatDate = 'dd/MM/yyyy';
    const String formatDateApi = 'yyyy-MM-dd';

    if (date != null && date.isNotEmpty) {
      DateTime dateTime = DateFormat(formatDateApi).parse(date);
      var outputFormat = DateFormat(formatDate);
      var outputDate = outputFormat.format(dateTime);
      return outputDate;
    } else {
      return '';
    }
  }
}
