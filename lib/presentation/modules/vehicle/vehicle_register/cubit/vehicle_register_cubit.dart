import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/file/illustration_file.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/usecases/building/building_usecase.dart';
import 'package:home_care/domain/usecases/file/upload_files_usecase.dart';
import 'package:home_care/domain/usecases/vehicle/vehicle_registration_usecase.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_register/cubit/vehicle_register_state.dart';
import 'package:home_care/presentation/widgets/list_bottom_sheeet.dart';

class VehicleRegisterCubit extends Cubit<VehicleRegisterState> {
  final useCase = getIt<VehicleRegistrationUseCase>();
  final buildingUsecase = getIt<BuildingUseCase>();
  final fileUsecase = getIt.get<UploadFilesUseCase>();

  VehicleRegisterCubit() : super(VehicleRegisterInitial());

  bool isUpdate = false;
  String id = "";

  Future<void> init({String? id}) async {
    //emit(VehicleRegisterState(userFullName: '', userId: '', isLoaded: false, selectedDate: null, vehicleCreateList: [], building: null, isValid: null, disableTempleSave: null));
    emit(VehicleRegisterInitial());
    emit(state.copyWith(isLoaded: false));
    final userProfile = await AppSecureStorage.getProfile();

    if (id != "null") {
      isUpdate = true;
      this.id = id ?? "";
      final vehicleHistoryDetail = await useCase.getVehicleHistoryDetail(id: id ?? "");

      /// List vehicle
      if (vehicleHistoryDetail.approvalStatus == "NEW") {
        List<VehicleCreate> list = [];

        for (var i = 0; i < (vehicleHistoryDetail.registeredVehicles?.length ?? 0); i++) {
          final element = vehicleHistoryDetail.registeredVehicles?[i];
          ImageModel frontPhoto = const ImageModel();
          ImageModel backPhoto = const ImageModel();

          if (element?.files?.isNotEmpty ?? false) {
            frontPhoto = ImageModel(
              type: ImageType.network,
              networkData: IllustrationFile(
                viewUrl: element?.files?.first.viewUrl,
                downloadUrl: element?.files?.first.downloadUrl,
                fileType: ImageType.network,
                originalName: element?.files?.first.originalName,
              ),
            );
          }

          if ((element?.files?.isNotEmpty ?? false) && (element?.files?.length ?? 0) >= 2) {
            backPhoto = ImageModel(
              type: ImageType.network,
              networkData: IllustrationFile(
                viewUrl: element?.files?[1].viewUrl,
                downloadUrl: element?.files?[1].downloadUrl,
                fileType: ImageType.network,
                originalName: element?.files?[1].originalName,
              ),
            );
          }

          list.add(
            VehicleCreate(
                licensePlate: element?.licensePlate,
                vehicleTypeCode: vehicleHistoryDetail.registeredVehicleStatistics?[i].code,
                ownerName: element?.ownerName,
                manufacturer: element?.manufacturer,
                model: element?.model,
                color: element?.color,
                vehicleTypeId: element?.vehicleTypeId,
                vehicleTypeName: element?.vehicleTypeName,
                backPhoto: backPhoto,
                frontPhoto: frontPhoto,
                files: element?.files
                    ?.map(
                      (e) => ImageModel(
                        networkData: IllustrationFile(
                            viewUrl: e.viewUrl,
                            downloadUrl: e.downloadUrl,
                            originalName: e.originalName,
                            fileType: ImageType.network),
                      ),
                    )
                    .toList()),
          );
        }

        /// Building
        final buildingSelect = RowItem(
          id: vehicleHistoryDetail.buildingId,
          name: vehicleHistoryDetail.buildingName,
        );

        /// Month
        final now = DateTime.now();
        final DateTime dateTime =
            DateTime(vehicleHistoryDetail.year ?? now.year, vehicleHistoryDetail.month ?? now.year);

        emit(state.copyWith(
            vehicleCreateList: list, building: buildingSelect, selectedDate: dateTime));
      }
    } else {
      isUpdate = false;
    }

    await _getBuildingList();

    emit(state.copyWith(
      isLoaded: true,
      userFullName: userProfile?.fullName,
      userId: userProfile?.id,
    ));

    checkValidate();
  }

  showDatePicker(BuildContext context) async {
    final tr = Utils.languageOf(context);
    showListBottomSheet(
      context: context,
      selectItem: _dateToRowItem(),
      data: Future.sync(() => DateTimeUtils.getMonthList()),
      title: tr.registration_period,
      onTap: (value) {
        emit(state.copyWith(selectedDate: value.value));
        checkValidate();
      },
    );
  }

  void addVehicle(VehicleCreate vehicleCreate) {
    final vehicleCreateList = [...state.vehicleCreateList];
    vehicleCreateList.add(vehicleCreate);
    emit(state.copyWith(vehicleCreateList: vehicleCreateList));
    checkValidate();
  }

  RowItem _dateToRowItem() {
    final selectedMonth = state.selectedDate.month;

    return DateTimeUtils.getMonthList().firstWhere(
      (element) => element.value.month == selectedMonth,
      orElse: () => RowItem(
        value: DateTime.now(),
        title: '',
      ),
    );
  }

  void chooseBuilding(BuildContext context) {
    final tr = Utils.languageOf(context);
    showListBottomSheet(
        context: context,
        data: _getBuildingList(),
        title: tr.chooseBuilding,
        selectItem: state.building,
        onTap: (value) {
          emit(
            state.copyWith(building: value, vehicleCreateList: []),
          );
          checkValidate();
        });
  }

  Future<List<RowItem>> _getBuildingList() async {
    final buildingList = await buildingUsecase.getUserBuildingList();

    if (buildingList.length == 1) {
      emit(state.copyWith(building: buildingList.firstOrNull));
    }

    return buildingList;
  }

  void editVehicle(VehicleCreate data, int index) {
    final vehicleCreateList = [...state.vehicleCreateList];
    vehicleCreateList[index] = data;
    emit(state.copyWith(vehicleCreateList: vehicleCreateList));
    checkValidate();
  }

  void deleteVehicle(int index) {
    final vehicleCreateList = [...state.vehicleCreateList];
    vehicleCreateList.removeAt(index);
    emit(state.copyWith(vehicleCreateList: vehicleCreateList));
    checkValidate();
  }

  void checkValidate() {
    final isValid = state.vehicleCreateList.isNotEmpty && state.building.id != null;
    emit(state.copyWith(isValid: isValid));
    checkDisableTempleSave();
  }

  Future<bool> onTapTempleSave() async {
    Utils.showLoading();
    final List<VehicleCreate> listVehicleCreate = [];

    for (var e in state.vehicleCreateList) {
      if (e.frontPhoto != null) {
        final frontPhoto = await uploadFiles([e.frontPhoto!]);
        e = e.copyWith(fileIds: [...(e.fileIds ?? []), ...frontPhoto]);
      }

      if (e.backPhoto != null) {
        final backPhoto = await uploadFiles([e.backPhoto!]);
        e = e.copyWith(fileIds: [...(e.fileIds ?? []), ...backPhoto]);
      }

      listVehicleCreate.add(e);
    }

    final vehicleRegistrationReq = VehicleRegistrationRequest(
      buildingId: state.building.id,
      issuedUserId: state.userId,
      month: state.selectedDate.month,
      year: state.selectedDate.year,
      vehicleCreates: listVehicleCreate,
      //contractId: ,
      //organizationId: "840802a6-e5d7-47e1-8fe9-53cc10f7d265",
      //thresholdPriceDay: ,
    );

    vehicleRegistrationReq.toJson();
    bool result = false;
    if (isUpdate) {
      result = await useCase.updateVehicle(id: id, data: vehicleRegistrationReq);
    } else {
      result = await useCase.vehicleTempleSave(vehicleRegistrationReq);
    }

    Utils.hideLoading();
    return result;
  }

  Future<bool> requestRegisterVehicle() async {
    Utils.showLoading();
    final List<VehicleCreate> listVehicleCreate = [];

    for (var e in state.vehicleCreateList) {
      if (e.frontPhoto != null) {
        final frontPhoto = await uploadFiles([e.frontPhoto!]);
        e = e.copyWith(fileIds: [...(e.fileIds ?? []), ...frontPhoto]);
      }

      if (e.backPhoto != null) {
        final backPhoto = await uploadFiles([e.backPhoto!]);
        e = e.copyWith(fileIds: [...(e.fileIds ?? []), ...backPhoto]);
      }

      listVehicleCreate.add(e);
    }

    final vehicleRegistrationReq = VehicleRegistrationRequest(
      buildingId: state.building.id,
      issuedUserId: state.userId,
      month: state.selectedDate.month,
      year: state.selectedDate.year,
      vehicleCreates: listVehicleCreate,
    );

    vehicleRegistrationReq.toJson();

    final result = await useCase.vehicleRegistration(vehicleRegistrationReq);

    Utils.hideLoading();

    return result;
  }

  Future<List<String>> uploadFiles(List<ImageModel> data) async {
    final List<File> files = data
        .where((element) => element.type == ImageType.local && element.file != null)
        .map((e) => e.file!)
        .toList();

    if (files.isEmpty) {
      return [
        ...data
            .where((element) => element.type == ImageType.network)
            .map((e) => e.networkData!.fileId!)
            .toList(),
      ];
    }

    final result = await fileUsecase.uploadFile(files);

    if (result != null) {
      return [
        ...data
            .where((element) => element.type == ImageType.network)
            .map((e) => e.networkData?.id ?? '')
            .toList(),
        ...result.map((e) => e.id ?? ''),
      ];
    }

    return [
      ...data
          .where((element) => element.type == ImageType.network)
          .map((e) => e.networkData!.fileId!)
          .toList(),
    ];
  }

  void checkDisableTempleSave() {
    emit(state.copyWith(disableTempleSave: state.building.id == null));
  }
}
