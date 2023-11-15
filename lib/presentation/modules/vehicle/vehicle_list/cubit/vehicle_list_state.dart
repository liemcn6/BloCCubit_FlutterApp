import 'package:equatable/equatable.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_history.dart';

import '../../../../../domain/entities/vehicle/vehicle_list.dart';

class VehicleListState extends Equatable {
  final TabType type;
  final VehicleList vehicleList;
  final VehicleHistory vehicleHistory;
  final bool isLoaded;

  const VehicleListState({
    this.type = TabType.registered,
    this.vehicleList = const VehicleList(),
    this.vehicleHistory = const VehicleHistory(),
    this.isLoaded = false,
  });

  VehicleListState copyWith({
    TabType? type,
    VehicleList? vehicleList,
    VehicleHistory? vehicleHistory,
    bool? isLoaded,
  }) {
    return VehicleListState(
      type: type ?? this.type,
      vehicleList: vehicleList ?? this.vehicleList,
      vehicleHistory: vehicleHistory ?? this.vehicleHistory,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object?> get props => [type, vehicleList, vehicleHistory, isLoaded];
}

enum TabType { registered, history }
