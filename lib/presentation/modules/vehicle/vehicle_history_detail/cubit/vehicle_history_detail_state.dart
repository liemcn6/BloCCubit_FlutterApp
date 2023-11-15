import 'package:equatable/equatable.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_history_detail.dart';

class VehicleHistoryDetailState extends Equatable {
  final VehicleHistoryDetail? vehicleHistoryDetail;

  const VehicleHistoryDetailState({
    this.vehicleHistoryDetail,
  });

  VehicleHistoryDetailState copyWith({
    VehicleHistoryDetail? vehicleHistoryDetail,
  }) {
    return VehicleHistoryDetailState(
      vehicleHistoryDetail: vehicleHistoryDetail ?? this.vehicleHistoryDetail,
    );
  }

  @override
  List<Object?> get props => [
        vehicleHistoryDetail,
      ];
}
