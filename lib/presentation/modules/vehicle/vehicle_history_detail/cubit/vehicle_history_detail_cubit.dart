import 'package:bloc/bloc.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/usecases/vehicle/vehicle_history_detail_usecase.dart';
import 'package:home_care/presentation/modules/vehicle/enum/vehicle_type.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_history_detail/cubit/vehicle_history_detail_state.dart';

class VehicleHistoryDetailCubit extends Cubit<VehicleHistoryDetailState> {
  VehicleHistoryDetailCubit() : super(const VehicleHistoryDetailState());

  final useCase = getIt<VehicleHistoryDetailUseCase>();

  Future initData({required String id}) async {
    Utils.showLoading();
    final vehicleHistoryDetail = await useCase.getVehicleHistoryDetail(id: id);
    emit(state.copyWith(vehicleHistoryDetail: vehicleHistoryDetail));
    Utils.hideLoading();
  }

  VehicleType getVehicleTypeByString({String? value}) {
    return VehicleType.getName(value ?? "");
  }
}
