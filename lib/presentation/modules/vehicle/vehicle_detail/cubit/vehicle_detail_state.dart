import 'package:equatable/equatable.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_detail.dart';

class VehicleDetailState extends Equatable {
  final VehicleDetail? vehicleDetail;

  const VehicleDetailState({
    this.vehicleDetail,
  });

  VehicleDetailState copyWith({
    VehicleDetail? vehicleDetail,
  }) {
    return VehicleDetailState(
      vehicleDetail: vehicleDetail ?? this.vehicleDetail,
    );
  }

  @override
  List<Object?> get props => [
        vehicleDetail,
      ];
}
