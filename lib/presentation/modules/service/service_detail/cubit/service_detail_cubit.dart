import 'package:bloc/bloc.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/service/service_detail_list_req.dart';
import 'package:home_care/domain/entities/service/service_detail.dart';
import 'package:home_care/domain/usecases/service/service_detail_usecase.dart';
import 'package:home_care/presentation/modules/service/service_detail/cubit/service_detail_state.dart';
import 'package:intl/intl.dart';

class ServiceDetailCubit extends Cubit<ServiceDetailState> {
  ServiceDetailCubit() : super(const ServiceDetailState());
  final useCase = getIt<ServiceDetailUseCase>();

  int pageIndex = 1;

  Future initData({required String buildingIds, required String facilityGroupIds}) async {
    pageIndex = 1;
    emit(state.copyWith(serviceDetailList: []));
    Utils.showLoading();
    final body = ServiceDetailListReq(
      buildingIds: [buildingIds],
      facilityGroupIds: [facilityGroupIds],
      pageIndex: pageIndex,
    );
    final response = await useCase.getServiceDetailList(body: body);

    if (response.length < 15) {
      pageIndex = 1;
      emit(state.copyWith(loadMore: false));
    } else {
      pageIndex++;
      emit(state.copyWith(loadMore: true));
    }

    emit(state.copyWith(serviceDetailList: response));
    Utils.hideLoading();
  }

  Future loadMore({required String buildingIds, required String facilityGroupIds}) async {
    final body = ServiceDetailListReq(
      buildingIds: [buildingIds],
      facilityGroupIds: [facilityGroupIds],
      pageIndex: pageIndex,
    );

    final response = await useCase.getServiceDetailList(body: body);

    List<ServiceDetail> data = List<ServiceDetail>.from(state.serviceDetailList ?? []);

    data.addAll(response);

    emit(state.copyWith(serviceDetailList: data));

    if (response.length < 15) {
      pageIndex = 1;
      emit(state.copyWith(loadMore: false));
    } else {
      pageIndex++;
      emit(state.copyWith(loadMore: true));
    }
  }

  Future getServiceDetail({required String id}) async {
    Utils.showLoading();
    final serviceDetail = await useCase.getServiceDetail(id: id);
    final now = DateTime.now();

    emit(
      state.copyWith(
        serviceDetail: serviceDetail,
        timeTemporarily: now,
        timeRegisterSelect: now,
        facilityOptionSelect: FacilityOption(),
      ),
    );
    checkDisableRegisterButton();
    Utils.hideLoading();
  }

  void changeFacilityOptionSelect(FacilityOption value) {
    emit(state.copyWith(facilityOptionSelect: value));
    checkDisableRegisterButton();
  }

  void changTimeRegisterSelect(DateTime value) {
    final dateGen = state.timeTemporarily;
    final days = daysBetween(dateGen ?? DateTime.now(), value);

    if (days >= 4) {
      emit(state.copyWith(timeTemporarily: value));
    }

    emit(state.copyWith(timeRegisterSelect: value));
    checkDisableRegisterButton();
  }

  String getDayWeed(DateTime datetime) {
    int index = datetime.weekday;
    switch (index) {
      case 1:
        return "T2";
      case 2:
        return "T3";
      case 3:
        return "T4";
      case 4:
        return "T5";
      case 5:
        return "T6";
      case 6:
        return "T7";
      case 7:
        return "CN";
      default:
        return "";
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  void checkDisableRegisterButton() {
    emit(state.copyWith(disableRegisterButton: state.facilityOptionSelect?.id == null));
  }

  Future<bool> callApiRegisterButton() async {
    final body = {
      "facilityGroupId": state.serviceDetail?.facilityGroupId ?? "",
      "facilityId": state.serviceDetail?.id,
      "facilityOptionId": state.facilityOptionSelect?.id ?? "",
      "registrationDate":
          DateFormat("yyyy-MM-dd").format(state.timeRegisterSelect ?? DateTime.now()),
    };
    return await useCase.bookingService(body: body);
  }
}
