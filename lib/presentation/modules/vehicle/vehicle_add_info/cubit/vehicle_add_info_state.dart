import 'package:equatable/equatable.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/file/image_model.dart';

class VehicleAddInfoState extends Equatable {
  final ImageModel? frontPhoto;
  final ImageModel? backPhoto;
  final RowItem? vehicleType;
  final String? owner;
  final RowItem? building;
  final bool isValid;

  const VehicleAddInfoState({
    this.frontPhoto,
    this.backPhoto,
    this.vehicleType,
    this.owner,
    this.building,
    this.isValid = false,
  });

  VehicleAddInfoState copyWith({
    ImageModel? frontPhoto,
    ImageModel? backPhoto,
    RowItem? vehicleType,
    String? owner,
    RowItem? building,
    bool? isValid,
  }) {
    return VehicleAddInfoState(
      frontPhoto: frontPhoto ?? this.frontPhoto,
      backPhoto: backPhoto ?? this.backPhoto,
      vehicleType: vehicleType ?? this.vehicleType,
      owner: owner ?? this.owner,
      building: building ?? this.building,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        frontPhoto,
        backPhoto,
        vehicleType,
        owner,
        building,
        isValid,
      ];
}
