part of 'core.dart';

class AppColors {
  final Color background;
  final Color accent;
  final Color disabled;
  final Color error;
  final Color divider;
  final Color signIn;
  final Color signOut;
  final Color border;
  final Color primary;
  final Color gray700;
  final Color gray400;
  final Color gray300;
  final Color gray600;
  final Color white;
  final Color positive;
  final Color orange;
  final Color green600;
  final Color green300;
  final Color orange200;
  final Color blue300;
  final Color gray200;
  final Color blueGrey100;
  final Color blueSecondary;
  final Color textGrey;
  final Color textGrey400;
  final Color text;
  final Color textTitle;
  final Color textLabel;
  final Color textValue;
  final Color green200;
  final Color blue;
  final Color blueAscent;
  final Color red;
  final Color tag;
  final Color dateTime;
  final Color colorFF00000;
  final Color progressBlank;
  final Color showMore;
  final Color secondGrey;
  final Color titleDialog;
  final Color buttonHazardous;
  final Color bgTextField;
  final Color emptyL;
  final Color skyBlue;
  final Color thirdGrey;
  final Color grayUnread;
  final Color blue200;
  final Color purple400;
  final Color secondaryLotus;
  final Color pendingColor;
  final Color pendingTextColor;
  final Color completedColor;
  final Color completedTextColor;
  final Color inprogressColor;
  final Color inprogressTextColor;
  final Color greyText;
  final Color overdue;
  final Color btnSecondary;
  final Color blue3;
  final Color overdueBg;
  final Color newBg;
  final Color disabledBg;
  final Color disabledBorder;
  final Color gray100;
  final Color newShadowColor;
  final Color enableTextColor;
  final Color disabledTextColor;
  final Color newBackgroundColor;
  final Color colorNeutral10;
  final Color colorNeutral3;
  final Color colorNewTextSubTitle;
  final Color dividerColor;
  final Color neutralDark13;
  final Color btnBorderSecondary;
  final Color neutral2;
  final Color neutral3;
  final Color neutral10;
  final Color neutral13;
  final Color yellow8;
  final Color yellow1;
  final Color blue8;
  final Color blue1;
  final Color purple8;
  final Color purple1;
  final Color green1;
  final Color green8;
  final Color newDropShadowColor;
  final Color neutral6;
  final Color calendarWeekGray;
  final Color textBody;
  final Color colorBlackIcon;

  const AppColors({
    required this.background,
    required this.accent,
    required this.disabled,
    required this.error,
    required this.divider,
    required this.signIn,
    required this.signOut,
    required this.border,
    required this.primary,
    required this.gray700,
    required this.gray400,
    required this.gray300,
    required this.gray600,
    required this.white,
    required this.positive,
    required this.orange,
    required this.green600,
    required this.green300,
    required this.orange200,
    required this.blue300,
    required this.gray200,
    required this.blueGrey100,
    required this.blueSecondary,
    required this.textGrey,
    required this.textGrey400,
    required this.text,
    required this.textTitle,
    required this.textLabel,
    required this.textValue,
    required this.green200,
    required this.blue,
    required this.blueAscent,
    required this.red,
    required this.tag,
    required this.dateTime,
    required this.colorFF00000,
    required this.progressBlank,
    required this.showMore,
    required this.secondGrey,
    required this.titleDialog,
    required this.buttonHazardous,
    required this.bgTextField,
    required this.emptyL,
    required this.skyBlue,
    required this.thirdGrey,
    required this.grayUnread,
    required this.blue200,
    required this.purple400,
    required this.secondaryLotus,
    required this.pendingColor,
    required this.pendingTextColor,
    required this.completedColor,
    required this.completedTextColor,
    required this.inprogressColor,
    required this.inprogressTextColor,
    required this.greyText,
    required this.overdue,
    required this.btnSecondary,
    required this.blue3,
    required this.overdueBg,
    required this.newBg,
    required this.disabledBg,
    required this.disabledBorder,
    required this.gray100,
    required this.newShadowColor,
    required this.enableTextColor,
    required this.disabledTextColor,
    required this.newBackgroundColor,
    required this.colorNeutral10,
    required this.colorNeutral3,
    required this.colorNewTextSubTitle,
    required this.dividerColor,
    required this.neutralDark13,
    required this.btnBorderSecondary,
    required this.neutral2,
    required this.neutral3,
    required this.neutral10,
    required this.neutral13,
    required this.yellow8,
    required this.yellow1,
    required this.blue8,
    required this.blue1,
    required this.purple8,
    required this.purple1,
    required this.green1,
    required this.green8,
    required this.newDropShadowColor,
    required this.neutral6,
    required this.calendarWeekGray,
    required this.textBody,
    required this.colorBlackIcon,
  });

  factory AppColors.light() {
    return const AppColors(
      background: Color(0xffF8F9FE),
      accent: Color(0xff17c063),
      disabled: Color(0xffA1B1BA),
      error: Color(0xffE2331F),
      divider: Colors.black54,
      signIn: Color(0xff4285f4),
      signOut: Color(0xffc53829),
      border: Color(0xffCECECE),
      primary: Color(0xff39A07C),
      gray700: Color(0xff646464),
      gray400: Color(0xffD8D8D8),
      gray300: Color(0x7FD8D8D8),
      gray600: Color(0xFF747480),
      white: Colors.white,
      positive: Color(0xFF1FB266),
      orange: Color(0xFFECA805),
      green600: Color(0xFF19BCA4),
      green300: Color(0x4D00B69B),
      orange200: Color(0x33FFA800),
      blue300: Color(0x33369DFF),
      gray200: Color(0xFFF5F5F5),
      blueGrey100: Color(0xffAEC0D0),
      blueSecondary: Color(0xff07AAF3),
      textGrey: Color(0xff757575),
      textGrey400: Color(0xff9B9B9B),
      text: Color(0xff282828),
      textTitle: Color(0xff323E44),
      textLabel: Color(0xff646464),
      textValue: Color(0xff000000),
      green200: Color(0xff00B69B),
      blue: Color(0xff369DFF),
      blueAscent: Color(0xff177DDF),
      red: Color(0xffEC1A3B),
      tag: Color(0xffEBF3FF),
      dateTime: Color(0xff4B4B4B),
      colorFF00000: Color(0xff000000),
      progressBlank: Color(0xffD6E6FF),
      showMore: Color(0xff0054A5),
      secondGrey: Color(0xff616161),
      titleDialog: Color(0xffEC1A3B),
      buttonHazardous: Color(0xFFEC1A3B),
      bgTextField: Color(0xFFFFFFFF),
      emptyL: Color(0xffC6C6C6),
      skyBlue: Color(0xFFA0D2FF),
      thirdGrey: Color(0xffb1b1b1),
      grayUnread: Color(0xFFF2F9FF),
      blue200: Color(0xFF3180E8),
      purple400: Color(0xFFB4A5FA),
      secondaryLotus: Color(0xFFB4A5FA),
      pendingColor: Color(0xD70AF3F8),
      pendingTextColor: Color(0xD700AAF3),
      completedColor: Color(0xD31B6606),
      completedTextColor: Color(0xD31B6606),
      inprogressColor: Color(0xD1F1B627),
      inprogressTextColor: Color(0xD1F1B627),
      greyText: Color(0xFF646464),
      overdue: Color(0xFFEB2D4B),
      btnSecondary: Color(0xFF5C717C),
      blue3: Color(0xD824264E),
      overdueBg: Color(0xD0EB2D4B),
      newBg: Color(0xF3F3F3FF),
      disabledBg: Color(0xFFCCCCCC),
      disabledBorder: Color(0xFFEDEDED),
      gray100: Color(0xFFF7F7F7),
      newShadowColor: Color(0x26264F29),
      enableTextColor: Color(0xffC7D0D5),
      disabledTextColor: Color(0xffA1B1BA),
      colorNeutral3: Color(0xffD9E0E3),
      colorNeutral10: Color(0xff5C717C),
      colorNewTextSubTitle: Color(0xff69838F),
      dividerColor: Color(0xffC7D0D5),
      neutralDark13: Color(0xFF323E44),
      btnBorderSecondary: Color(0xFFD9E0E3),
      neutral2: Color(0xFFECEFF1),
      neutral3: Color(0xFFD9E0E3),
      neutral10: Color(0xFF5C717C),
      neutral13: Color(0xFF323E44),
      yellow8: Color(0xFFFCC500),
      yellow1: Color(0xFFFFF8DF),
      blue1: Color(0xFFDCECFE),
      blue8: Color(0xFF0668D8),
      purple8: Color(0xFF553AA1),
      purple1: Color(0xFFE9E4F5),
      green1: Color(0xFFE4F5EF),
      green8: Color(0xFF39A07C),
      newBackgroundColor: Color(0xffECEFF1),
      newDropShadowColor: Color(0x323E4429),
      neutral6: Color(0xffA1B1BA),
      calendarWeekGray: Color(0xff737373),
      textBody: Color(0xff444444),
      colorBlackIcon: Color(0xff212121),
    );
  }
}
