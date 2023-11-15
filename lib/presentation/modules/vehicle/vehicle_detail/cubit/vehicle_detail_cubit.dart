import 'package:bloc/bloc.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_list.dart';
import 'package:home_care/domain/usecases/vehicle/vehicle_detail_usecase.dart';
import 'package:home_care/presentation/modules/vehicle/enum/registration_status.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_detail/cubit/vehicle_detail_state.dart';

class VehicleDetailCubit extends Cubit<VehicleDetailState> {
  VehicleDetailCubit() : super(const VehicleDetailState());
  final useCase = getIt<VehicleDetailUseCase>();

  Future initData({required String id}) async {
    Utils.showLoading();
    final vehicleDetail = await useCase.getVehicleDetail(id: id);

    emit(state.copyWith(vehicleDetail: vehicleDetail));
    Utils.hideLoading();
  }

  VehicleStatus? getRegistrationStatusByString(String? value) {
    return RegistrationStatusExS.getEnumByString(value: value);
  }

  bool showButtonCancel(String? value) {
    return RegistrationStatusExS.getEnumByString(value: value) == VehicleStatus.active;
  }

  /// CALL API
  Future<bool> postCancelVehicle({required String id}) async {
    Utils.showLoading();
    final resultPass = await useCase.postCancelVehicle(id: id);

    Utils.hideLoading();

    return resultPass;
  }
}
