import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/models/request/ticket/update_ticket_request.dart';
import 'package:home_care/data/models/response/ticket/review_response.dart';
import 'package:home_care/domain/entities/file/illustration_file.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/entities/file/picker_image_type.dart';
import 'package:home_care/domain/entities/profile/user_profile.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/ticket/service_type.dart';
import 'package:home_care/domain/entities/ticket/ticket_item.dart';
import 'package:home_care/domain/entities/ticket/ticket_status.dart';
import 'package:home_care/domain/usecases/building/building_usecase.dart';
import 'package:home_care/domain/usecases/file/upload_files_usecase.dart';
import 'package:home_care/domain/usecases/ticket/detail_ticket_usecase.dart';
import 'package:home_care/presentation/widgets/list_bottom_sheeet.dart';
import 'package:image_picker/image_picker.dart';

part 'detail_ticket_state.dart';

class DetailTicketCubit extends Cubit<DetailTicketState> {
  final TextEditingController contentCtrl = TextEditingController();
  final TextEditingController noteCtrl = TextEditingController();
  final usecase = getIt.get<DetailTicketUseCase>();
  final fileUsecase = getIt.get<UploadFilesUseCase>();
  final buildingUseCase = getIt.get<BuildingUseCase>();

  DetailTicketCubit() : super(DetailTicketInitial());

  Future init(String id) async {
    await getUserProfile();

    await getTicketDetail(id);
  }

  Future<void> handlerRefresh(String id) async {
    await init(id);
  }

  changeUpdateMode() {
    emit(state.copyWith(
      isUpdate: !state.isUpdate,
    ));

    getTicketDetail(state.detailTicket.id ?? '');
  }

  bool checkValidate() {
    return Utils.isNullOrEmpty(state.building.id) ||
        Utils.isNullOrEmpty(state.floors.first.id) ||
        Utils.isNullOrEmpty(contentCtrl.text);
  }

  Future getTicketDetail(String id) async {
    emit(state.copyWith(isLoaded: false));
    final ticket = await usecase.getDetailTicket(id);
    String reviewButtonType;
    if (ticket != null) {
      contentCtrl.text = ticket.content ?? "";
      noteCtrl.text = ticket.note ?? "";
      if (ticket.issuedUserId == state.userProfile?.id) {
        if (ticket.review == null) {
          reviewButtonType = ReviewButtonType.edit;
        } else {
          reviewButtonType = ReviewButtonType.see;
        }
      } else {
        if (ticket.review == null) {
          reviewButtonType = ReviewButtonType.empty;
        } else {
          reviewButtonType = ReviewButtonType.see;
        }
      }
      emit(state.copyWith(
        detailTicket: ticket,
        status: ticket.status,
        building: RowItem(
          id: ticket.buildingId,
          name: ticket.buildingName,
          code: ticket.buildingCode,
        ),
        floors: ticket.ticketLocations
                ?.where((element) => element.floorId != null)
                .map((e) => RowItem(
                      id: e.floorId,
                      name: e.floorName,
                    ))
                .toList() ??
            [],
        company: RowItem(
          id: ticket.organizationId,
          name: ticket.organizationName,
        ),
        requester: RowItem(
          id: ticket.issuedUserId,
          name: ticket.issuedUserName,
        ),
        service: ServiceType.convertService(ticket.serviceType),
        assignee: RowItem(
          id: ticket.assigneeUserId,
          name: ticket.assigneeUserName,
        ),
        content: ticket.content,
        feedback: ticket.feedback,
        images: ticket.illustrationsFiles
            ?.map(
              (val) => ImageModel(
                networkData: IllustrationFile.fromEntity(val),
                type: ImageType.network,
              ),
            )
            .toList(),
        imagesAccept: ticket.status != TicketStatus.processing
            ? ticket.inspectionFiles
                ?.map(
                  (val) => ImageModel(
                    networkData: IllustrationFile.fromEntity(val),
                    type: ImageType.network,
                  ),
                )
                .toList()
            : null,
        imagesConfirm: ticket.confirmationFiles
            ?.map(
              (val) => ImageModel(
                networkData: IllustrationFile.fromEntity(val),
                type: ImageType.network,
              ),
            )
            .toList(),
        note: ticket.note,
        reviewButtonType: reviewButtonType,
        review: ticket.review,
      ));
    }
    emit(state.copyWith(isLoaded: true));
  }

  Future<List<RowItem>> getBuildingList() async {
    final result = await buildingUseCase.getBuildingList();

    emit(state.copyWith(
      buildingSize: result.length,
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
        emit(state.copyWith(
          building: item,
        ));

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

    final result = await buildingUseCase.getBuildingFloorList(state.building.id!);

    emit(state.copyWith(
      floorSize: result.length,
    ));

    return result;
  }

  void chooseFloor(BuildContext context) {
    final tr = Utils.languageOf(context);
    showListBottomSheet(
      context: context,
      data: getBuildingFloorList(),
      selectItem: state.floors.firstOrNull,
      title: tr.choose_floor,
      onTap: (item) {
        emit(state.copyWith(
          floors: [item],
        ));
      },
    );
  }

  void changeContent(String val) {
    emit(state.copyWith(
      content: val,
    ));
  }

  void onTapCamera(BuildContext context) async {
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

  // void onTapGallery(BuildContext context) async {
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

  void deleteImage(int i) {
    final images = [...state.images];

    if (images.isNotEmpty) {
      images.removeAt(i);

      emit(state.copyWith(
        images: images,
      ));
    }
  }

  void changeNote(String val) {}

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

  Future updateTicket({
    required GlobalKey<FormState> formKeyCT3,
    required AppLocalizations lang,
    required String status,
  }) async {
    final uploadFileIds = await uploadFiles();

    final updateBody = UpdateTicketRequest(
      id: state.detailTicket.id,
      buildingId: state.building.id,
      content: contentCtrl.text,
      floorId: state.floors.first.id,
      floorIds: state.floors.map((e) => e.id ?? '').toList(),
      isCustomerTicket: true,
      note: noteCtrl.text,
      status: status,
      illustrationsFiles: uploadFileIds,
    );

    final result = await usecase.updateTicket(updateBody);

    if (result) {
      changeUpdateMode();
      // AppNavigator.pop(true);
    }
  }

  Future<void> getUserProfile() async {
    final userProfile = await AppSecureStorage.getProfile();

    if (userProfile != null) {
      emit(state.copyWith(
        userProfile: userProfile,
        userId: userProfile.id,
      ));
    }
  }
}
