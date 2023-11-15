import 'package:equatable/equatable.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/file/image_model.dart';

class VehicleEditInfoState extends Equatable {
  final ImageModel? frontPhoto;
  final ImageModel? backPhoto;
  final RowItem building;
  final RowItem vehicleType;
  final bool isValid;
  final List<ImageModel> listImage;

  const VehicleEditInfoState({
    this.frontPhoto,
    this.backPhoto,
    this.building = const RowItem(),
    this.vehicleType = const RowItem(),
    this.isValid = false,
    this.listImage = const [],
  });

  VehicleEditInfoState copyWith({
    ImageModel? frontPhoto,
    ImageModel? backPhoto,
    RowItem? building,
    RowItem? vehicleType,
    bool? isValid,
    List<ImageModel>? listImage,
  }) {
    return VehicleEditInfoState(
      frontPhoto: frontPhoto ?? this.frontPhoto,
      backPhoto: backPhoto ?? this.backPhoto,
      building: building ?? this.building,
      vehicleType: vehicleType ?? this.vehicleType,
      isValid: isValid ?? this.isValid,
      listImage: listImage ?? this.listImage,
    );
  }

  @override
  List<Object?> get props => [
        frontPhoto,
        backPhoto,
        building,
        vehicleType,
        isValid,
        listImage,
      ];
}
