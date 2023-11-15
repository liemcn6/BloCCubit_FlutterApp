import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/usecases/vehicle/vehicle_registration_usecase.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_add_info/cubit/vehicle_add_info_state.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_register/components/vehicle_register_view.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/list_bottom_sheeet.dart';
import 'package:image_picker/image_picker.dart';

class VehicleAddInfoCubit extends Cubit<VehicleAddInfoState> {
  final String buildingId;
  final usecase = getIt.get<VehicleRegistrationUseCase>();

  final vehicleOwnerCtrl = TextEditingController();
  final vehiclePlateCtrl = TextEditingController();
  final vehicleBrandCtrl = TextEditingController();
  final vehicleModelCtrl = TextEditingController();
  final vehicleColorCtrl = TextEditingController();

  VehicleAddInfoCubit({
    required this.buildingId,
  }) : super(const VehicleAddInfoState());

  Future<void> init() async {}

  void onTapCamera({required bool isFontPhoto}) async {
    final photos = await FileUtils.getImages(ImageSource.camera);
    final photo = photos.firstOrNull;

    if (photo != null) {
      final image = ImageModel(
        file: photo,
        type: ImageType.local,
      );

      if (isFontPhoto) {
        emit(state.copyWith(
          frontPhoto: image,
        ));
      } else {
        emit(state.copyWith(
          backPhoto: image,
        ));
      }
    }
  }

  void onTapGallery({required bool isFontPhoto}) async {
    const remaining = 1;
    final photos = await FileUtils.getImages(ImageSource.gallery);

    if (photos.isNotEmpty) {
      final images = photos.map((e) => ImageModel(file: e, type: ImageType.local)).toList();

      if (images.length > remaining) {
        images.removeRange(remaining, images.length);
      }

      if (isFontPhoto) {
        emit(state.copyWith(
          frontPhoto: images.firstOrNull,
        ));
      } else {
        emit(state.copyWith(
          backPhoto: images.firstOrNull,
        ));
      }
    }
  }

  void delImage({required bool isFontPhoto}) {
    if (isFontPhoto) {
      emit(VehicleAddInfoState(
        backPhoto: state.backPhoto,
        building: state.building,
        frontPhoto: null,
        isValid: state.isValid,
        owner: state.owner,
        vehicleType: state.vehicleType,
      ));
    } else {
      emit(VehicleAddInfoState(
        backPhoto: null,
        building: state.building,
        frontPhoto: state.frontPhoto,
        isValid: state.isValid,
        owner: state.owner,
        vehicleType: state.vehicleType,
      ));
    }
  }

  void chooseVehicleType(BuildContext context) {
    final tr = Utils.languageOf(context);
    showListBottomSheet(
      context: context,
      data: _getVehicleTypes(),
      title: tr.range_of_vehicle,
      selectItem: state.vehicleType,
      onTap: (value) {
        emit(state.copyWith(vehicleType: value));
        checkValidate();
      },
    );
  }

  Future<List<RowItem>> _getVehicleTypes() => usecase.getVehicleTypes(buildingId);

  void checkValidate() {
    final isValid = state.vehicleType?.id != null &&
        !Utils.isNullOrEmpty(vehicleOwnerCtrl.text) &&
        !Utils.isNullOrEmpty(vehiclePlateCtrl.text) &&
        !Utils.isNullOrEmpty(vehicleBrandCtrl.text);

    emit(state.copyWith(isValid: isValid));
  }

  void doAddVehicle() async {
    final vehicleCreate = VehicleCreate(
      color: vehicleColorCtrl.text,
      frontPhoto: state.frontPhoto,
      backPhoto: state.backPhoto,
      ownerName: vehicleOwnerCtrl.text,
      licensePlate: vehiclePlateCtrl.text,
      manufacturer: vehicleBrandCtrl.text,
      model: vehicleModelCtrl.text,
      vehicleTypeId: state.vehicleType?.id,
      registrationDate: DateTime.now(),
      vehicleTypeCode: state.vehicleType?.code,
      vehicleTypeName: state.vehicleType?.name,
    );

    AppNavigator.pop(VehicleRouteResult(vehicleCreate: vehicleCreate));
  }
}
