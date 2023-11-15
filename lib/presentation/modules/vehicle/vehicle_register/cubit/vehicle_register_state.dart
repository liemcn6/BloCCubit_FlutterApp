import 'package:equatable/equatable.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';

class VehicleRegisterState extends Equatable {
  final bool isLoaded;
  final String userFullName;
  final String userId;
  final DateTime selectedDate;
  final List<VehicleCreate> vehicleCreateList;
  final RowItem building;
  final bool isValid;
  final bool disableTempleSave;

  const VehicleRegisterState({
    required this.userFullName,
    required this.userId,
    required this.isLoaded,
    required this.selectedDate,
    required this.vehicleCreateList,
    required this.building,
    required this.isValid,
    required this.disableTempleSave,
  });

  @override
  List<Object?> get props => [
        userFullName,
        userId,
        isLoaded,
        selectedDate,
        vehicleCreateList,
        building,
        isValid,
        disableTempleSave,
      ];

  VehicleRegisterState copyWith({
    bool? isLoaded,
    String? userFullName,
    String? userId,
    DateTime? selectedDate,
    List<VehicleCreate>? vehicleCreateList,
    RowItem? building,
    bool? isValid,
    bool? disableTempleSave,
  }) {
    return VehicleRegisterState(
      isLoaded: isLoaded ?? this.isLoaded,
      userFullName: userFullName ?? this.userFullName,
      userId: userId ?? this.userId,
      selectedDate: selectedDate ?? this.selectedDate,
      vehicleCreateList: vehicleCreateList ?? this.vehicleCreateList,
      building: building ?? this.building,
      isValid: isValid ?? this.isValid,
      disableTempleSave: disableTempleSave ?? this.disableTempleSave,
    );
  }
}

class VehicleRegisterInitial extends VehicleRegisterState {
  VehicleRegisterInitial()
      : super(
          isLoaded: false,
          userFullName: '',
          userId: '',
          selectedDate: DateTime.now(),
          vehicleCreateList: [],
          building: const RowItem(),
          isValid: false,
          disableTempleSave: false,
        );
}
