import 'package:bloc/bloc.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/domain/entities/profile/user_profile.dart';
import 'package:home_care/domain/entities/service/service_register_detail.dart';
import 'package:home_care/domain/usecases/service/service_history_usecase.dart';
import 'package:home_care/presentation/modules/service/service_history_detail/cubit/service_history_detail_state.dart';
import 'package:intl/intl.dart';

class ServiceHistoryDetailCubit extends Cubit<ServiceHistoryDetailState> {
  ServiceHistoryDetailCubit() : super(const ServiceHistoryDetailState());

  final useCase = getIt<ServiceHistoryUseCase>();

  int pageIndex = 1;
  ServiceRegisterDetail? serviceRegister;

  Future initData({required String id}) async {
    Utils.showLoading();
    final serviceRegister = await useCase.getServiceRegisterDetail(id: id);

    emit(state.copyWith(
        isLoaded: true,
        serviceHistoryList: serviceRegister.histories,
        serviceRegisterDetail: serviceRegister));
    await enableCancelButton();
    Utils.hideLoading();
  }

  void switchTab(ServiceHistoryDetailType type) {
    Log.i(type.name);
    emit(state.copyWith(type: type));
  }

  void checkDisableConfirm(String val) {
    emit(state.copyWith(disableConfirm: val.trim() == ""));
  }

  Future<bool> enableCancelButton() async {
    ServiceRegisterDetail? dataSelected = state.serviceRegisterDetail;
    final now = DateTime.now();

    UserProfile? userProfile = await AppSecureStorage.getProfile();
    Utils.hideLoading();
    if (dataSelected != null && userProfile?.id == dataSelected.issuedUserId) {
      final status = dataSelected.status;
      final dateFormat = DateFormat('dd/MM/yyyy');
      final registrationDateFormated =
          dateFormat.parse(dataSelected.registrationDate!).toIso8601String();
      switch (status) {
        case "APPROVED":
          {
            final isBeforeOneHour = DateTime.now().subtract(const Duration(hours: 1));
            final hour = DateTime.fromMillisecondsSinceEpoch(dataSelected.startTime!);
            final startTime =
                DateTime(now.year, now.month, now.day, hour.hour, hour.minute, hour.second, 0, 0);

            if (DateTime.parse(registrationDateFormated).isAfter(now) &&
                isBeforeOneHour.isAfter(startTime)) {
              emit(state.copyWith(showCancelButton: true, callApiCancelApproval: false));
            }

            break;
          }
        case "WAIT_APPROVE" || "WAIT_CANCEL":
          {
            emit(state.copyWith(showCancelButton: true, callApiCancelApproval: true));
            break;
          }
      }
    }
    return true;
  }

  Future<bool> callApiCancel({required String id, required String request}) async {
    if (state.callApiCancelApproval) {
      return await useCase.postServiceCancelApproval(id: id, request: request);
    } else {
      return await useCase.postServiceCancel(id: id, request: request);
    }
  }
}
