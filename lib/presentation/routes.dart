import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/data/models/response/ticket/review_response.dart';
import 'package:home_care/presentation/modules/authentication/change_password/change_password_screen.dart';
import 'package:home_care/presentation/modules/authentication/forgot_password/forgot_password_screen.dart';
import 'package:home_care/presentation/modules/authentication/login/cubit/login_cubit.dart';
import 'package:home_care/presentation/modules/authentication/register/register_screen.dart';
import 'package:home_care/presentation/modules/authentication/register/register_success_screen.dart';
import 'package:home_care/presentation/modules/bill/bill_detail/bill_detail_screen.dart';
import 'package:home_care/presentation/modules/bill/bill_history/bill_history_list_screen.dart';
import 'package:home_care/presentation/modules/bill/bill_list/bill_list_screen.dart';
import 'package:home_care/presentation/modules/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:home_care/presentation/modules/community_newsletter/community_newsletter_details/community_newsletter_details.dart';
import 'package:home_care/presentation/modules/community_newsletter/community_newsletter_main/community_newsletter.dart';
import 'package:home_care/presentation/modules/contract/contract/contract_screen.dart';
import 'package:home_care/presentation/modules/emergency_support/emergency_support_screen.dart';
import 'package:home_care/presentation/modules/notification/notification_details/notification_details_screen.dart';
import 'package:home_care/presentation/modules/notification/notification_main/notification_main_screen.dart';
import 'package:home_care/presentation/modules/payment_management/payment_detail/payment_detail_screen.dart';
import 'package:home_care/presentation/modules/payment_management/payment_history/payment_history_screen.dart';
import 'package:home_care/presentation/modules/payment_management/payment_list/payment_list_screen.dart';
import 'package:home_care/presentation/modules/payment_management/payment_list_detail/payment_list_detail_screen.dart';
import 'package:home_care/presentation/modules/profile/profile_edit/profile_edit_screen.dart';
import 'package:home_care/presentation/modules/profile/profile_info/profile_info_screen.dart';
import 'package:home_care/presentation/modules/service/service_detail/service_detail_screen.dart';
import 'package:home_care/presentation/modules/service/service_history_detail/service_history_detail_screen.dart';
import 'package:home_care/presentation/modules/service/service_registration/service_registration_screen.dart';
import 'package:home_care/presentation/modules/setting/app_info/app_info_screen.dart';
import 'package:home_care/presentation/modules/setting/language/language_screen.dart';
import 'package:home_care/presentation/modules/setting/privacy_policy/privacy_policy_screen.dart';
import 'package:home_care/presentation/modules/setting/setting_main/settings_screen.dart';
import 'package:home_care/presentation/modules/survey/do_survey/do_survey_screen.dart';
import 'package:home_care/presentation/modules/survey/survey_details/survey_details_screen.dart';
import 'package:home_care/presentation/modules/survey/survey_main/survey_main_screen.dart';
import 'package:home_care/presentation/modules/ticket/create_ticket/create_ticket_screen.dart';
import 'package:home_care/presentation/modules/ticket/detail_ticket/detail_ticket_screen.dart';
import 'package:home_care/presentation/modules/ticket/list_ticket/list_ticket_screen.dart';
import 'package:home_care/presentation/modules/ticket/review_ticket/review_ticket_screen.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_add_info/vehicle_add_info_screen.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_detail/vehicle_detail_screen.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_edit_info/vehicle_edit_info_screen.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_history_detail/vehicle_history_detail_screen.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_list/vehicle_list_screen.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_register/vehicle_register_screen.dart';

import 'modules/authentication/login/login_screen.dart';
import 'modules/contract/contract_detail/contract_detail_screen.dart';
import 'modules/service/service_list/service_list_screen.dart';
import 'modules/splash/splash.dart';

enum Routes {
  splash,
  home,
  login,
  emergencySupport,
  newsMain,
  newsDetails,
  notificationMain,
  notificationDetails,
  settingMain,
  changePassword,
  appInfo,
  language,
  privacyPolicy,
  bottomNavigationBar,
  listTicket,
  forgotPassword,
  profileInfo,
  profileEdit,
  contract,
  contractDetail,
  detailTicket,
  createTicket,
  paymentList,
  paymentListDetail,
  paymentDetail,
  languageScreen,
  paymentHistory,
  register,
  registerSuccess,
  service,
  bill,
  billDetail,
  billHistory,
  vehicleList,
  vehicleDetail,
  vehicleDetailHistory,
  vehicleRegister,
  vehicleAddInfo,
  vehicleEditInfo,
  serviceDetail,
  reviewTicket,
  surveyMain,
  surveyDo,
  surveyDetail,
  serviceRegistration,
  serviceHistoryDetail
}

abstract class _RoutePath {
  static const String splash = '/';
  // static const String home = '/home';
  static const String login = '/authentication/login';
  static const String emergencySupport = '/emergency-support';
  static const String newsMain = "/community_newsletter/community_newsletter_main";
  static const String newsDetails = "/community_newsletter/community_newsletter_details";
  static const String notificationMain = "/notification/notificaton_main";
  static const String notificationDetails = "/notification/notificaton_details";
  static const String settingMain = "/setting/setting_main";
  static const String changePassword = "/authentication/change_password";
  static const String appInfo = "/setting/app_info";
  static const String language = "/setting/language";
  static const String privacyPolicy = "/setting/privacy_policy";
  static const String bottomNavigationBar = "/bottom_navigation_bar";
  static const String listTicket = '/ticket/list';
  static const String forgotPassword = '/authentication/forgot-password';
  static const String profileInfo = "profile/profile_info";
  static const String profileEdit = "profile/profile_edit";
  static const String contract = "/contract/contract/contract_screen";
  static const String contractDetail = "/contract/contract_detail/contract_detail_screen";
  static const String detailTicket = '/ticket/detail';
  static const String createTicket = '/ticket/create';
  static const String paymentList = '/payment/list';
  static const String paymentListDetail = '/payment/list/detail';
  static const String paymentDetail = '/payment/detail';
  static const String languageScreen = '/setting/language/language_screen';
  static const String paymentHistory = '/payment/history';
  static const String register = '/authentication/register';
  static const String registerSuccess = '/authentication/register/success';
  static const String service = '/service';
  static const String bill = '/bill';
  static const String billDetail = '/bill/detail';
  static const String billHistory = '/bill/history';
  static const String vehicleList = '/vehicle/vehicle_list';
  static const String vehicleDetail = '/vehicle/vehicle_detail';
  static const String vehicleHistoryDetail = '/vehicle/vehicle_history_detail';
  static const String vehicleRegister = '/vehicle/vehicle_register';
  static const String vehicleAddInfo = '/vehicle/vehicle_add_info';
  static const String vehicleEditInfo = '/vehicle/vehicle_edit_info';
  static const String reviewTicket = '/ticket/review_ticket';
  static const String surveyMain = '/survey/survey_main';
  static const String surveyDo = '/survey/do_survey';
  static const String surveyDetail = '/survey/survey_details';
  static const String serviceDetail = '/service/service_detail';
  static const String serviceRegistration = '/service/registration';
  static const String serviceHistoryDetail = '/service/service_history_detail';
}

class _RouteConfig {
  static const Map<Routes, String> _pathMap = {
    Routes.splash: _RoutePath.splash,
    // Routes.home: _RoutePath.home,
    Routes.login: _RoutePath.login,
    Routes.emergencySupport: _RoutePath.emergencySupport,
    Routes.newsMain: _RoutePath.newsMain,
    Routes.newsDetails: _RoutePath.newsDetails,
    Routes.contract: _RoutePath.contract,
    Routes.contractDetail: _RoutePath.contractDetail,
    Routes.notificationMain: _RoutePath.notificationMain,
    Routes.notificationDetails: _RoutePath.notificationDetails,
    Routes.settingMain: _RoutePath.settingMain,
    Routes.changePassword: _RoutePath.changePassword,
    Routes.appInfo: _RoutePath.appInfo,
    Routes.language: _RoutePath.language,
    Routes.privacyPolicy: _RoutePath.privacyPolicy,
    Routes.bottomNavigationBar: _RoutePath.bottomNavigationBar,
    Routes.listTicket: _RoutePath.listTicket,
    Routes.forgotPassword: _RoutePath.forgotPassword,
    Routes.profileInfo: _RoutePath.profileInfo,
    Routes.profileEdit: _RoutePath.profileEdit,
    Routes.detailTicket: _RoutePath.detailTicket,
    Routes.createTicket: _RoutePath.createTicket,
    Routes.paymentList: _RoutePath.paymentList,
    Routes.paymentListDetail: _RoutePath.paymentListDetail,
    Routes.paymentDetail: _RoutePath.paymentDetail,
    Routes.languageScreen: _RoutePath.languageScreen,
    Routes.paymentHistory: _RoutePath.paymentHistory,
    Routes.register: _RoutePath.register,
    Routes.registerSuccess: _RoutePath.registerSuccess,
    Routes.service: _RoutePath.service,
    Routes.bill: _RoutePath.bill,
    Routes.billDetail: _RoutePath.billDetail,
    Routes.billHistory: _RoutePath.billHistory,
    Routes.vehicleList: _RoutePath.vehicleList,
    Routes.vehicleDetail: _RoutePath.vehicleDetail,
    Routes.vehicleDetailHistory: _RoutePath.vehicleHistoryDetail,
    Routes.vehicleRegister: _RoutePath.vehicleRegister,
    Routes.vehicleAddInfo: _RoutePath.vehicleAddInfo,
    Routes.vehicleEditInfo: _RoutePath.vehicleEditInfo,
    Routes.reviewTicket: _RoutePath.reviewTicket,
    Routes.surveyMain: _RoutePath.surveyMain,
    Routes.surveyDo: _RoutePath.surveyDo,
    Routes.surveyDetail: _RoutePath.surveyDetail,
    Routes.serviceDetail: _RoutePath.serviceDetail,
    Routes.serviceRegistration: _RoutePath.serviceRegistration,
    Routes.serviceHistoryDetail: _RoutePath.serviceHistoryDetail,
  };

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _RoutePath.login:
        return IOSRoute(page: const LoginScreen());
      case _RoutePath.bottomNavigationBar:
        final selectedIndex = int.parse(settings.arguments.toString());
        return IOSRoute(
            page: BottomNavigationBarWidget(
          selectedIndex: selectedIndex,
        ));
      // return IOSRoute(page: const BottomNavigationBarWidget());
      // case _RoutePath.home:
      //   return IOSRoute(page: const HomeScreen());
      case _RoutePath.emergencySupport:
        return IOSRoute(page: const EmergencySupportScreen());
      case _RoutePath.newsMain:
        return IOSRoute(page: const CommunityNewsletter());
      case _RoutePath.contract:
        return IOSRoute(page: const ContractScreen());
      case _RoutePath.contractDetail:
        final id = settings.arguments.toString();
        return IOSRoute(
            page: ContractDetailScreen(
          contractId: id,
        ));
      case _RoutePath.newsDetails:
        final newsDetailsId = settings.arguments.toString();
        return IOSRoute(page: CommunityNewsLetterDetails(id: newsDetailsId));
      case _RoutePath.notificationMain:
        return IOSRoute(page: const NotificationMainScreen());
      case _RoutePath.notificationDetails:
        final notificationDetailsId = settings.arguments.toString();
        return IOSRoute(
            page: NotificationDetailScreen(
          id: notificationDetailsId,
        ));
      case _RoutePath.settingMain:
        return IOSRoute(page: const SettingMainScreen());
      case _RoutePath.appInfo:
        return IOSRoute(page: const AppInfoScreen());
      case _RoutePath.language:
        return IOSRoute(page: const ChangePasswordScreen());
      case _RoutePath.privacyPolicy:
        return IOSRoute(page: const PrivacyPolicyScreen());
      case _RoutePath.listTicket:
        return IOSRoute(page: const ListTicketScreen());
      case _RoutePath.forgotPassword:
        return IOSRoute(page: const ForgotPasswordScreen());
      case _RoutePath.profileInfo:
        return IOSRoute(page: const ProfileInfoScreen());
      case _RoutePath.profileEdit:
        return IOSRoute(page: const ProfileEditScreen());
      case _RoutePath.detailTicket:
        final id = settings.arguments.toString();
        return IOSRoute(page: DetailTicketScreen(ticketId: id));
      case _RoutePath.createTicket:
        return IOSRoute(page: const CreateTicketScreen());
      case _RoutePath.paymentList:
        return IOSRoute(page: const PaymentListScreen());
      case _RoutePath.languageScreen:
        return IOSRoute(page: const LanguageScreen());

      case _RoutePath.paymentListDetail:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;

        return IOSRoute(
            page: PaymentListDetailScreen(
          contractId: args['contractId'],
          contractNo: args['contractNo'],
        ));
      case _RoutePath.paymentDetail:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;

        return IOSRoute(
            page: PaymentDetailScreen(
          contractNumber: args['contractNumber'],
          paymentId: args['paymentId'],
          periodDate: args['periodDate'],
        ));
      case _RoutePath.changePassword:
        return IOSRoute(page: const ChangePasswordScreen());
      case _RoutePath.paymentHistory:
        return IOSRoute(page: const PaymentHistoryScreen());
      case _RoutePath.register:
        return IOSRoute(page: const RegisterScreen());
      case _RoutePath.registerSuccess:
        return IOSRoute(page: const RegisterSuccessScreen());
      case _RoutePath.service:
        return IOSRoute(page: const ServiceListScreen());
      case _RoutePath.bill:
        return IOSRoute(page: const BillListScreen());
      case _RoutePath.billDetail:
        final billId = settings.arguments.toString();
        return IOSRoute(page: BillDetailScreen(billId));
      case _RoutePath.billHistory:
        final billId = settings.arguments.toString();
        return IOSRoute(page: BillHistoryScreen(billId));
      case _RoutePath.vehicleList:
        return IOSRoute(page: const VehicleListScreen());
      case _RoutePath.vehicleDetail:
        final id = settings.arguments.toString();
        return IOSRoute(page: VehicleDetailScreen(id: id));
      case _RoutePath.vehicleHistoryDetail:
        final id = settings.arguments.toString();
        return IOSRoute(
            page: VehicleHistoryDetailScreen(
          id: id,
        ));
      case _RoutePath.vehicleRegister:
        final id = settings.arguments.toString();
        return IOSRoute(page: VehicleRegisterScreen(id: id));
      case _RoutePath.vehicleAddInfo:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        final buildingId = args['buildingId'] as String;
        return IOSRoute(
          page: VehicleAddInfoScreen(buildingId: buildingId),
        );
      case _RoutePath.vehicleEditInfo:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        final buildingId = args['buildingId'] as String;
        final vehicleCreate = args['vehicleCreate'] as VehicleCreate;
        final isEdit = args['isEdit'] as bool?;
        return IOSRoute(
          page: VehicleEditInfoScreen(
            buildingId: buildingId,
            vehicleCreate: vehicleCreate,
            isEdit: isEdit ?? true,
          ),
        );
      case _RoutePath.reviewTicket:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        final ticketId = args['ticketId'] as String;
        final review = args['review'] as ReviewResponse;
        final isReviewed = args['isReviewed'] as bool?;

        return IOSRoute(
            page: ReviewTicketScreen(ticketId: ticketId, review: review, isReviewed: isReviewed));
      case _RoutePath.surveyMain:
        return IOSRoute(page: const SurveyMainScreen());
      case _RoutePath.surveyDo:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return IOSRoute(
            page: DoSurveyScreen(
          id: args["id"],
          buildingId: args["buildingId"],
        ));
      case _RoutePath.surveyDetail:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return IOSRoute(
            page: SurveyDetailsScreen(
          id: args["id"],
          buildingId: args["buildingId"],
        ));
      case _RoutePath.serviceDetail:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;

        return IOSRoute(
            page: ServiceDetailScreen(
          buildingId: args['buildingId'],
          facilityGroupIds: args['facilityGroupIds'],
          nameScreen: args['nameScreen'],
        ));
      case _RoutePath.serviceRegistration:
        return IOSRoute(page: const ServiceRegistrationScreen());

      case _RoutePath.serviceHistoryDetail:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return IOSRoute(
            page: ServiceHistoryDetailScreen(
          id: args['id'],
        ));

      default:
        return IOSRoute(
          page: BlocProvider(
            create: (_) => LoginCubit(),
            child: const SplashScreen(),
          ),
        );
    }
  }

  static String of(Routes route) => _pathMap[route] ?? _RoutePath.splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    return _RouteConfig.onGenerateRoute(settings);
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_RouteConfig.of(route), arguments: arguments);

  static Future? replace<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_RouteConfig.of(route), arguments: arguments);

  static Future? pushRoot<T>(Routes route, [T? arguments]) =>
      state?.pushNamedAndRemoveUntil(_RouteConfig.of(route), (Route<dynamic> route) => false,
          arguments: arguments);

  static void pop([result]) => state?.pop(result);

  static NavigatorState? get state => navigatorKey.currentState;
}

class FadeRoute extends PageRouteBuilder {
  FadeRoute({required this.page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        );

  final Widget page;
}

class IOSRoute extends PageRouteBuilder {
  IOSRoute({required this.page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) => SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
            child: child,
          ),
        );

  final Widget page;
}
