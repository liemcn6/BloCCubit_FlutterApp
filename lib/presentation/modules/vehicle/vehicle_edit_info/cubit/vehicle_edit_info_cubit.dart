import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/usecases/vehicle/vehicle_registration_usecase.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_edit_info/cubit/vehicle_edit_info_state.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_register/components/vehicle_register_view.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/list_bottom_sheeet.dart';
import 'package:image_picker/image_picker.dart';

class VehicleEditInfoCubit extends Cubit<VehicleEditInfoState> {
  final String buildingId;
  final VehicleCreate vehicleCreate;
  final usecase = getIt.get<VehicleRegistrationUseCase>();

  final vehicleOwnerCtrl = TextEditingController();
  final vehiclePlateCtrl = TextEditingController();
  final vehicleBrandCtrl = TextEditingController();
  final vehicleModelCtrl = TextEditingController();
  final vehicleColorCtrl = TextEditingController();

  VehicleEditInfoCubit({
    required this.buildingId,
    required this.vehicleCreate,
  }) : super(const VehicleEditInfoState());

  Future<void> init() async {
    vehicleOwnerCtrl.text = vehicleCreate.ownerName ?? '';
    vehiclePlateCtrl.text = vehicleCreate.licensePlate ?? '';
    vehicleBrandCtrl.text = vehicleCreate.manufacturer ?? '';
    vehicleModelCtrl.text = vehicleCreate.model ?? '';
    vehicleColorCtrl.text = vehicleCreate.color ?? '';

    emit(state.copyWith(
      backPhoto: vehicleCreate.backPhoto,
      frontPhoto: vehicleCreate.frontPhoto,
      vehicleType: RowItem(
        id: vehicleCreate.vehicleTypeId,
        code: vehicleCreate.vehicleTypeCode,
        name: vehicleCreate.vehicleTypeName,
      ),
      listImage: vehicleCreate.files,
    ));

    checkValidate();
  }

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

      // if(isFontPhoto){
      //   emit(state.copyWith(
      //     frontPhoto:  image,
      //   ));
      // }else{
      //   emit(state.copyWith(
      //     backPhoto:  image,
      //   ));
      // }
    }
  }

  void delImage({required bool isFontPhoto}) {
    if (isFontPhoto) {
      emit(VehicleEditInfoState(backPhoto: state.backPhoto));
    } else {
      emit(VehicleEditInfoState(frontPhoto: state.frontPhoto));
    }
  }

  void checkValidate() {
    final isValid = state.vehicleType.id != null &&
        !Utils.isNullOrEmpty(vehicleOwnerCtrl.text) &&
        !Utils.isNullOrEmpty(vehiclePlateCtrl.text) &&
        !Utils.isNullOrEmpty(vehicleBrandCtrl.text);

    emit(state.copyWith(isValid: isValid));
  }

  void chooseVehicleType(BuildContext context) {
    final tr = Utils.languageOf(context);
    showListBottomSheet(
      context: context,
      data: _getVehicleTypes(),
      selectItem: state.vehicleType,
      title: tr.range_of_vehicle,
      onTap: (value) {
        emit(state.copyWith(vehicleType: value));
        checkValidate();
      },
    );
  }

  Future<List<RowItem>> _getVehicleTypes() => usecase.getVehicleTypes(buildingId);

  void doUpdateVehicle() async {
    Utils.dismissKeyboard();
    final vehicleCreate = VehicleCreate(
      color: vehicleColorCtrl.text,
      frontPhoto: state.frontPhoto,
      backPhoto: state.backPhoto,
      ownerName: vehicleOwnerCtrl.text,
      licensePlate: vehiclePlateCtrl.text,
      manufacturer: vehicleBrandCtrl.text,
      model: vehicleModelCtrl.text,
      vehicleTypeId: state.vehicleType.id,
      registrationDate: DateTime.now(),
      vehicleTypeCode: state.vehicleType.code,
      vehicleTypeName: state.vehicleType.name,
    );

    AppNavigator.pop(VehicleRouteResult(vehicleCreate: vehicleCreate));
  }
}
