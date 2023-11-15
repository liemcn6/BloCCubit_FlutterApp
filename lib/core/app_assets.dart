part of 'core.dart';

const String _imagePath = 'assets/images';
const String _svgPath = 'assets/svgs';

class AppImages {
  static const backgroundApp = _Image('background_app.png');
  static const bgApp = _Image('bg_app.png');
  static const bgHeaderBuild = _Image('bg_header_build.png');
  static const bgHome = _Image('bg_home.png');
  static const bgHomeSecond = _Image('bg_home_second.png');
  static const blankAvatar = _Image('blank_avatar.png');
  static const fullIconWhite = _Image('full_logo_white.png');
  static const fullLogo = _Image('full_logo.png');
  static const empty = _Image('empty.png');
  static const icAccountBlack = _Image('ic_account_black.png');
  static const icSiteBlack = _Image('ic_site_black.png');
  static const icContractBlack = _Image('ic_contract_black.png');
  static const icFullLogoWhite = _Image('ic_full_logo_white.png');
  static const appLogo = _Image('app_logo.png');
  static const mainAppLogo = _Image('app_icon.png');
  static const icService = _Image('ic_service.png');
  static const icBill = _Image('ic_bill.png');
  static const icNews = _Image('ic_news.png');
  static const icRequest = _Image('ic_request.png');
  static const icMarket = _Image('ic_market.png');
  static const icVerhicle = _Image('ic_verhicle.png');
  static const icContract = _Image('ic_contract.png');
  static const icSupport = _Image('ic_support.png');
  static const icMore = _Image('ic_more.png');
  static const icSurvey = _Image('ic_survey.png');
  static const newsHeader = _Image('news_header.png');
  static const bgHeaderService = _Image('bg_header_service.png');
  static const bgHeaderBill = _Image('bg_header_bill.png');
  static const contractHeader = _Image('contract_header.png');
  static const bgTransportManagement = _Image('bg_transport_management.png');
  static const limitedAccess = _Image('limited_access.png');
  static const noImage = _Image('no_image.jpg');
  static const icOther = _Image('ic_other.png');
}

class AppSvgs {
  static final hidePassword = _Svg('hide_password.svg').load;
  static final showPassword = _Svg('show_password.svg').load;
  static final icBackWhite = _Svg('ic_back_white.svg').load;
  static final icAttendance = _Svg('ic_attendance.svg').load;
  static final icCalendar = _Svg(
    'ic_calendar.svg',
    AppColors.light().textTitle,
  ).load;
  static final icCallAdd = _Svg('ic_call_add.svg').load;
  static final icCamera = _Svg('ic_camera.svg').load;
  static final icCameraAddGrey = _Svg('ic_camera_add.svg', AppColors.light().textTitle).load;

  static final icCameraAdd = _Svg('ic_camera_add.svg', AppColors.light().primary).load;
  static final icChecklist = _Svg('ic_checklist.svg').load;
  static final icCheckListGetStart = _Svg('ic_check_list_get_start.svg').load;
  static final icChecklistTechnic = _Svg('ic_checklist_technic.svg').load;
  static final icChevronBack = _Svg('ic_chevron_back.svg').load;
  static final icChevronDropdown = _Svg('ic_chevron_dropdown.svg').load;
  static final icChevronForward = _Svg('ic_chevron_forward.svg').load;
  static final icClock = _Svg('ic_clock.svg').load;
  static final icClose = _Svg('ic_close.svg', AppColors.light().primary).load;
  static icCloseWithColor(Color color) => _Svg('ic_close.svg', color).load;
  static final icContract = _Svg('ic_contract.svg').load;
  static final icContractInfo = _Svg('ic_contract_info.svg').load;
  static final icContractGround = _Svg('ic_contract_ground.svg').load;
  static final icContractFinance = _Svg('ic_contract_finance.svg').load;
  static final icCar = _Svg('ic_car.svg', AppColors.light().neutral3).load;
  static final icCarNeutral13 = _Svg('ic_car.svg', AppColors.light().neutral13).load;
  static final icMotobike = _Svg('ic_motobike.svg', AppColors.light().neutral3).load;
  static final icMotobikeNeutral13 = _Svg('ic_motobike.svg', AppColors.light().neutral13).load;
  static final icDailyReportSenitationPersonel =
      _Svg('ic_daily_report_sanitation_personnel.svg').load;
  static final icDelete = _Svg('ic_delete.svg', AppColors.light().white, 24, 24).load;
  static final icDeleteRed = _Svg('ic_delete.svg').load;
  static final icDeletePrimary = _Svg('ic_delete.svg', AppColors.light().primary).load;
  static final icDislike = _Svg('ic_dislike.svg').load;
  static final icDone = _Svg('ic_done.svg').load;
  static final icDownload = _Svg('ic_download.svg').load;
  static final icEdit = _Svg('ic_edit.svg').load;
  static final icEditCircle = _Svg('ic_edit_circle.svg').load;
  static final icEn = _Svg('ic_en.svg').load;
  static final icExtraordinaryExamination = _Svg('ic_extraordinary_examination.svg').load;
  static final icFaceId = _Svg('ic_face_id.svg', AppColors.light().primary).load;
  static final icFeedback = _Svg('ic_feedback.svg').load;
  static final icFilter = _Svg('ic_filter.svg').load;
  static final icGeneralBuildingInspection = _Svg('ic_general_building_inspection.svg').load;
  static final icHome = _Svg('ic_home.svg', AppColors.light().primary).load;
  static final icHomeWhite = _Svg('ic_home.svg', AppColors.light().white).load;
  static var icHomeUnselected = _Svg('ic_home.svg', AppColors.light().gray700).load;
  static final icHomeOutline = _Svg('ic_home_outline.svg').load;
  static final icIncident = _Svg('ic_incident.svg').load;
  static final icInformation = _Svg('ic_information.svg', AppColors.light().primary).load;
  static final icChangePw = _Svg('ic_change_pw.svg', AppColors.light().primary).load;
  static final icLanguage = _Svg('ic_language.svg', AppColors.light().primary).load;
  static final icLike = _Svg('ic_like.svg').load;
  static final icNotification = _Svg('ic_notification.svg').load;
  static final icOt = _Svg('ic_ot.svg').load;
  static final icPayment = _Svg('ic_payment.svg').load;
  static final icPersonelCheck = _Svg('ic_personel_check.svg').load;
  static final icProfile = _Svg('ic_profile.svg', AppColors.light().primary).load;
  static final icReport = _Svg('ic_report.svg').load;
  static final icRequest = _Svg('ic_request.svg').load;
  static var icRequestUnselected = _Svg('ic_request.svg', AppColors.light().gray700).load;
  static final icSettings = _Svg('ic_settings.svg').load;
  static var icSettingsUnselected = _Svg('ic_settings.svg', AppColors.light().gray700).load;
  static final icShiftCalendar = _Svg('ic_shift_calendar.svg').load;
  static final icShowMore = _Svg('ic_show_more.svg').load;
  static final icSignOut = _Svg('ic_sign_out.svg', AppColors.light().primary).load;
  static final icStar = _Svg('ic_star.svg').load;
  static final icStarOutline = _Svg('ic_star_outline.svg').load;
  static final icStarHalf = _Svg('ic_star_half.svg').load;
  static final icStarSmall = _Svg('ic_star.svg', null, 13, 12).load;
  static final icStarOutlineSmall = _Svg('ic_star_outline.svg', null, 13, 12).load;
  static final icStarHalfSmall = _Svg('ic_star_half.svg', null, 13, 12).load;
  static final icTransfer = _Svg('ic_transfer.svg').load;
  static final icTiangleDropDown = _Svg('ic_triangle_dropdown.svg').load;
  static final icVi = _Svg('ic_vi.svg').load;
  static final icWarning = _Svg('ic_warning.svg').load;
  static var icBill = _Svg('ic_bill.svg').load;
  static var icMarket = _Svg('ic_market.svg').load;
  static var icMonthlyVerhicle = _Svg('ic_mothly_verhicle.svg').load;
  static var icNews = _Svg('ic_news.svg').load;
  static var icRequestReflect = _Svg('ic_request_reflect.svg').load;
  static var icUtilityService = _Svg('ic_utility_service.svg').load;
  static var icLogo = _Svg('ic_logo.svg').load;
  static var icMore = _Svg('ic_more.svg').load;
  static final icEmergencySupport = _Svg('ic_emergency_support.svg').load;
  static final icFamily = _Svg('ic_family.svg').load;
  static final icTag = _Svg('ic_tag.svg').load;
  static final icImageAdd = _Svg('ic_image_add.svg').load;
  static final icEmpty = _Svg('ic_empty.svg').load;
  static final icSuccess = _Svg('ic_success.svg').load;
  static final icCheck = _Svg('ic_check.svg').load;
  static final icBack323E44 = _Svg('ic_back_white.svg', const Color(0xFF323E44)).load;
  static final icEyeClosed = _Svg('ic_eye_closed.svg', AppColors.light().neutral13).load;
  static final icEye = _Svg('ic_eye.svg', AppColors.light().neutral13).load;
  static final icGalleryAdd = _Svg('ic_gallery_add.svg').load;
  static final icTrash = _Svg('ic_trash.svg').load;
  static final icTrashWhite = _Svg('ic_trash.svg', AppColors.light().white).load;
  static final icInfo = _Svg('ic_info.svg', AppColors.light().primary).load;
  static final icHistory = _Svg('ic_history.svg').load;
  static final icConnection = _Svg('ic_connection.svg').load;
  static final icBike = _Svg('ic_bike.svg').load;
  static final icBikeNeutral13 = _Svg('ic_bike_black.svg').load;
  static icDeleteWithColor(Color color) => _Svg('ic_delete.svg', color, 24, 24).load;
  static final icLocal = _Svg('ic_local.svg').load;
  static final icOclock = _Svg('ic_oclock.svg').load;
}

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class _Svg {
  final String _fileName;
  final Color? _color;
  final double? _width;
  final double? _height;

  _Svg(this._fileName, [Color? color, double? _width, double? _height])
      : _color = color,
        _width = _width,
        _height = _height;

  SvgPicture get load => SvgPicture.asset(
        '$_svgPath/$_fileName',
        colorFilter: _color == null ? null : ColorFilter.mode(_color!, BlendMode.srcIn),
        height: _height,
        width: _width,
      );
}
