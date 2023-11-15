import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/models/request/ticket/create_ticket_request.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/entities/file/picker_image_type.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/usecases/building/building_usecase.dart';
import 'package:home_care/domain/usecases/file/upload_files_usecase.dart';
import 'package:home_care/domain/usecases/ticket/create_ticket_usecase.dart';
import 'package:home_care/presentation/widgets/list_bottom_sheeet.dart';
import 'package:home_care/presentation/widgets/multi_select_list_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

part 'create_ticket_state.dart';

class CreateTicketCubit extends Cubit<CreateTicketState> {
  final buildingUsecase = getIt.get<BuildingUseCase>();
  final fileUsecase = getIt.get<UploadFilesUseCase>();
  final usecase = getIt.get<CreateTicketUseCase>();
  final contentCtrl = TextEditingController();
  final noteCtrl = TextEditingController();

  CreateTicketCubit() : super(CreateTicketInitial());

  Future<void> init() async {
    emit(state.copyWith(isLoaded: false));
    final buildingList = await getBuildingList();

    if (buildingList.length == 1) {
      emit(state.copyWith(
        building: buildingList.first,
      ));

      final floorList = await getBuildingFloorList();

      if (floorList.length == 1) {
        emit(state.copyWith(
          floors: [floorList.first],
        ));
      }
    }
    emit(state.copyWith(isLoaded: true));
  }

  void changeContent(String val) {
    emit(state.copyWith(
      content: val,
    ));
  }

  void onTapCamera() async {
    final photos = await FileUtils.getImages(ImageSource.camera);
    final photo = photos.firstOrNull;

    if (photo != null) {
      final image = ImageModel(
        file: photo,
        type: ImageType.local,
      );

      emit(state.copyWith(
        images: [...state.images, image],
      ));
    }
  }

  // void onTapGallery() async {
  //   final remaining = 5 - state.images.length;
  //   final photos = await FileUtils.getImages(ImageSource.gallery);
  //
  //   if (photos.isNotEmpty) {
  //     final images = photos.map((e) => ImageModel(file: e, type: ImageType.local)).toList();
  //
  //     if (images.length > remaining) {
  //       images.removeRange(remaining, images.length);
  //     }
  //
  //     emit(state.copyWith(
  //       images: [...state.images, ...images],
  //     ));
  //   }
  // }

  Future<void> onTapGallery(BuildContext context) async {
    var data = await FileUtils.getImage2(
      context: context,
      type: PickerImageType.multiImageGallery,
      maxAssets: 5 - state.images.length,
    );
    if (!Utils.isNullOrEmpty(data) && data is List) {
      List<ImageModel> images = [];
      for (var val in data) {
        images = [...images, ImageModel(path: val, file: File(val))];
      }
      emit(state.copyWith(
        images: [...state.images, ...images],
      ));
    }
  }

  void delImage(int i) {
    if (state.images.isNotEmpty) {
      final images = [...state.images];
      images.removeAt(i);

      emit(state.copyWith(
        images: images,
      ));
    }
  }

  void onTapDocument() async {
    final remaining = 5 - state.images.length;
    final files = await FileUtils.getFiles();

    if (files.isNotEmpty) {
      final images = files.map((e) => ImageModel(file: e, type: ImageType.local)).toList();

      if (images.length > remaining) {
        images.removeRange(remaining, images.length);
      }

      emit(state.copyWith(
        images: [...state.images, ...images],
      ));
    }
  }

  void changeNote(String val) {}

  Future<List<RowItem>> getBuildingList() async {
    final result = await buildingUsecase.getBuildingList();

    emit(state.copyWith(
      buildingsSize: result.length,
    ));

    return result;
  }

  void chooseBuilding(BuildContext context) async {
    final tr = Utils.languageOf(context);
    showListBottomSheet(
      context: context,
      data: getBuildingList(),
      selectItem: state.building,
      title: tr.choose_building,
      onTap: (item) async {
        emit(state.copyWith(building: item, floors: []));

        final floorList = await getBuildingFloorList();

        if (floorList.length == 1) {
          emit(state.copyWith(
            floors: [floorList.first],
          ));
        }
      },
    );
  }

  Future<List<RowItem>> getBuildingFloorList() async {
    if (state.building.id == null) {
      return [];
    }

    final result = await buildingUsecase.getBuildingFloorList(state.building.id!);

    emit(state.copyWith(
      floorSize: result.length,
    ));

    return result;
  }

  void chooseFloor(BuildContext context) {
    final tr = Utils.languageOf(context);
    showMultiSelectListBottomSheet(
      context: context,
      data: getBuildingFloorList(),
      selectedItems: state.floors.toList(),
      title: tr.choose_floor,
      onMultiSelect: (List<RowItem> selectedItems) {
        emit(state.copyWith(
          floors: selectedItems,
        ));
      },
    );
  }

  Future<List<String>> uploadFiles() async {
    final List<File> files = state.images
        .where((element) => element.type == ImageType.local && element.file != null)
        .map((e) => e.file!)
        .toList();

    if (files.isEmpty) {
      return [
        ...state.images
            .where((element) => element.type == ImageType.network)
            .map((e) => e.networkData!.fileId!)
            .toList(),
      ];
    }

    final result = await fileUsecase.uploadFile(files);

    if (result != null) {
      return [
        ...state.images
            .where((element) => element.type == ImageType.network)
            .map((e) => e.networkData?.id ?? '')
            .toList(),
        ...result.map((e) => e.id ?? ''),
      ];
    }

    return [
      ...state.images
          .where((element) => element.type == ImageType.network)
          .map((e) => e.networkData!.fileId!)
          .toList(),
    ];
  }

  Future<bool> createTicket({
    required GlobalKey<FormState> formKeyCT2,
    required AppLocalizations lang,
    required String status,
  }) async {
    Utils.dismissKeyboard();
    Utils.showLoading();
    bool rp = false;

    final uploadedFiles = await uploadFiles();
    final profile = await AppSecureStorage.getProfile();

    final createTicketBody = CreateTicketRequest(
      illustrationsFiles: uploadedFiles,
      buildingId: state.building.id,
      floorId: state.floors.firstOrNull?.id,
      issuedUserId: profile?.id,
      status: status,
      content: contentCtrl.text.trim(),
      note: noteCtrl.text.trim(),
      isCustomerTicket: true,
      floorIds: state.floors.map((e) => e.id!).toList(),
    );

    final result = await usecase.createTicket(createTicketBody);

    if (result != null && result.isNotEmpty) {
      rp = true;
    }

    Utils.hideLoading();

    return rp;
  }

  bool checkValidate() {
    return contentCtrl.text.isEmpty ||
        state.building.id == null ||
        state.floors.isEmpty ||
        state.floors.firstOrNull?.id == null;
  }

  void cleanData() {
    contentCtrl.text = "";
    noteCtrl.text = "";
    emit(
      state.copyWith(
        building: const RowItem(),
        buildingsSize: 0,
        floors: const [],
        floorSize: 0,
        images: const [],
      ),
    );
  }
}
