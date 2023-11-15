import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/repositories/authentication/change_password_repo_impl.dart';
import 'package:home_care/data/repositories/authentication/forgot_password_repo_impl.dart';
import 'package:home_care/data/repositories/bill/bill_list_repo_impl.dart';
import 'package:home_care/data/repositories/contract/contract_repository_impl.dart';
import 'package:home_care/data/repositories/emergency_support/emergency_support_repository_impl.dart';
import 'package:home_care/data/repositories/file/file_repository_impl.dart';
import 'package:home_care/data/repositories/news/community_newsletter_repo_impl.dart';
import 'package:home_care/data/repositories/notification/notification_repo_impl.dart';
import 'package:home_care/data/repositories/service/service_detail_repo_impl.dart';
import 'package:home_care/data/repositories/service/service_history_repo_impl.dart';
import 'package:home_care/data/repositories/service/service_registration_repo_impl.dart';
import 'package:home_care/data/repositories/survey/survey_repo_impl.dart';
import 'package:home_care/data/repositories/ticket/create_ticket_repo_impl.dart';
import 'package:home_care/data/repositories/ticket/review_ticket_repo_impl.dart';
import 'package:home_care/data/repositories/vehicle/vehicle_detail_repo_impl.dart';
import 'package:home_care/data/repositories/vehicle/vehicle_history_detail_repo_impl.dart';
import 'package:home_care/domain/usecases/authentication/change_password_usecase.dart';
import 'package:home_care/domain/usecases/authentication/forgot_password_usecase.dart';
import 'package:home_care/domain/usecases/authentication/register_usecase.dart';
import 'package:home_care/domain/usecases/bill/bill_list_usecase.dart';
import 'package:home_care/domain/usecases/building/building_usecase.dart';
import 'package:home_care/domain/usecases/contract/contract_usecase.dart';
import 'package:home_care/domain/usecases/emergency_support/emergency_support_usecase.dart';
import 'package:home_care/domain/usecases/file/upload_files_usecase.dart';
import 'package:home_care/domain/usecases/news/community_newsletter_usecase.dart';
import 'package:home_care/domain/usecases/notification/notification_useccase.dart';
import 'package:home_care/domain/usecases/payment_management/payment_detail_usecase.dart';
import 'package:home_care/domain/usecases/payment_management/payment_history_usecase.dart';
import 'package:home_care/domain/usecases/payment_management/payment_list_detail_usecase.dart';
import 'package:home_care/domain/usecases/payment_management/payment_list_usecase.dart';
import 'package:home_care/domain/usecases/profile/profile_edit_usecase.dart';
import 'package:home_care/domain/usecases/profile/profile_usecase.dart';
import 'package:home_care/domain/usecases/service/service_detail_usecase.dart';
import 'package:home_care/domain/usecases/service/service_history_usecase.dart';
import 'package:home_care/domain/usecases/service/service_registration_usecase.dart';
import 'package:home_care/domain/usecases/survey/survey_usecase.dart';
import 'package:home_care/domain/usecases/ticket/create_ticket_usecase.dart';
import 'package:home_care/domain/usecases/ticket/detail_ticket_usecase.dart';
import 'package:home_care/domain/usecases/ticket/list_ticket_usecase.dart';
import 'package:home_care/domain/usecases/ticket/review_ticket_usecase.dart';
import 'package:home_care/domain/usecases/vehicle/vehicle_detail_usecase.dart';
import 'package:home_care/domain/usecases/vehicle/vehicle_history_detail_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/core.dart';
import 'data/repositories/authentication/login_repo_impl.dart';
import 'data/repositories/authentication/profile_repo_impl.dart';
import 'data/repositories/building/building_repo_impl.dart';
import 'data/repositories/service/service_list_repo_impl.dart';
import 'data/repositories/ticket/detail_ticket_repo_impl.dart';
import 'data/repositories/ticket/list_ticket_repo_impl.dart';
import 'data/repositories/vehicle/vehicle_list_repo_impl.dart';
import 'domain/usecases/authentication/login_usecase.dart';
import 'domain/usecases/bill/bill_detail_usecase.dart';
import 'domain/usecases/service/service_list_usecase.dart';
import 'domain/usecases/vehicle/vehicle_list_usecase.dart';
import 'domain/usecases/vehicle/vehicle_registration_usecase.dart';

class DependencyInjection {
  static Future<void> init() async {
    final pref = await SharedPreferences.getInstance();
    final deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      getIt.registerSingleton(androidDeviceInfo);
    }

    if (Platform.isIOS) {
      final iOSDeviceInfo = await deviceInfoPlugin.iosInfo;
      getIt.registerSingleton(iOSDeviceInfo);
    }

    getIt.registerSingleton(pref);
    getIt.registerSingleton(AppSecureStorage.init());

    // UseCases DI
    getIt.registerSingleton(NotificationUseCase(NotificationRepoImpl()));
    getIt.registerSingleton(BuildingUseCase(BuildingRepoImpl()));
    getIt.registerSingleton(LoginUseCase(LoginRepoImpl()));
    getIt.registerSingleton(EmergencySupportUseCase(EmergencySupportRepositoryImpl()));
    getIt.registerSingleton(CommunityNewsletterUseCase(CommunityNewsletterRepoImpl()));
    getIt.registerSingleton(ForgotPasswordUseCase(ForgotPasswordRepoImpl()));
    getIt.registerSingleton(ProfileUseCase(ProfileRepoImpl()));
    getIt.registerSingleton(ProfileEditUseCase(FileRepositoryImpl(), ProfileRepoImpl()));
    getIt.registerSingleton(ChangePasswordUsecase(ChangePasswordRepoImpl()));

    /// Quản lý hợp đồng
    getIt.registerSingleton(ContractUseCase(ContractRepositoryImpl()));
    getIt.registerSingleton(ListTicketUseCase(ListTicketRepositoryImpl()));
    getIt.registerSingleton(DetailTicketUseCase(DetailTicketRepoImpl()));
    getIt.registerSingleton(UploadFilesUseCase(FileRepositoryImpl()));
    getIt.registerSingleton(CreateTicketUseCase(CreateTicketRepoImpl()));

    getIt.registerSingleton(PaymentListUseCase());
    getIt.registerSingleton(PaymentListDetailUsecase());
    getIt.registerSingleton(PaymentDetailUseCase());
    getIt.registerSingleton(PaymentHistoryUseCase());

    getIt.registerSingleton(RegisterUseCase());

    // Bill
    getIt.registerSingleton(BillListUseCase(BillListRepoImpl()));
    getIt.registerSingleton(BillDetailUseCase());

    //survey
    getIt.registerSingleton(SurveyUsecase(SurveyRepoImpl()));
    // Vehicle
    getIt.registerSingleton(VehicleRegistrationUseCase());
    getIt.registerSingleton(VehicleListUseCase(VehicleListRepoImpl()));
    getIt.registerSingleton(VehicleDetailUseCase(VehicleDetailRepoImpl()));
    getIt.registerSingleton(VehicleHistoryDetailUseCase(VehicleHistoryDetailRepoImpl()));

    // Service
    getIt.registerSingleton(ServiceListUseCase(ServiceListRepoImpl()));
    getIt.registerSingleton(ServiceDetailUseCase(ServiceDetailRepoImpl()));
    getIt.registerSingleton(ServiceHistoryUseCase(ServiceHistoryRepoImpl()));
    getIt.registerSingleton(ServiceRegistrationUseCase(
      ServiceRegistrationRepoImpl(),
      BuildingRepoImpl(),
    ));

    //ticket
    getIt.registerSingleton(ReviewTicketUsecase(ReviewTicketRepoImpl()));
  }
}
