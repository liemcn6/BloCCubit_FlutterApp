import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/ticket/review_ticket_request.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/usecases/file/upload_files_usecase.dart';
import 'package:home_care/domain/usecases/ticket/review_ticket_usecase.dart';
import 'package:home_care/presentation/modules/ticket/review_ticket/models/item_row_model.dart';
import 'package:home_care/presentation/widgets/dialog_custom.dart';
import 'package:image_picker/image_picker.dart';

part 'review_ticket_state.dart';

class ReviewTicketCubit extends Cubit<ReviewTicketState> {
  ReviewTicketCubit() : super(ReviewTicketInitial());

  final fileUsecase = getIt.get<UploadFilesUseCase>();
  final ticketUsecase = getIt.get<ReviewTicketUsecase>();

  TextEditingController feedbackCtrl = TextEditingController();
  RatingItemRequest quality = RatingItemRequest();
  //hande refresh
  Future<void> handlerRefresh() async {
    // await getInit();
  }

  //cahnge quality
  void changeQualityRating(int pos) {
    quality.rating = pos;
    emit(state.copyWith(quality: quality));
  }

  //change image
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

  void onTapGallery() async {
    final remaining = 5 - state.images.length;
    final photos = await FileUtils.getImages(ImageSource.gallery);

    if (photos.isNotEmpty) {
      final images = photos.map((e) => ImageModel(file: e, type: ImageType.local)).toList();

      if (images.length > remaining) {
        images.removeRange(remaining, images.length);
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

  //change feedback
  void changeFeedback(String val) {
    emit(state.copyWith(feedback: val));
  }

  //send review
  Future<void> sendReview(
      {required context,
      required AppLocalizations lang,
      required AppTheme theme,
      required String id}) async {
    var result = await sendReviewApi(id, context);
    if (result) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogCustom(
            title: lang.notify,
            content: lang.successfulReview,
            textBtnAccept: lang.close,
            onPressBtnCancel: () {},
            onPressBtnAccept: () async {
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
            },
          );
        },
      );
    }
  }

  Future<bool> sendReviewApi(String id, context) async {
    bool isDone = false;
    final uploadedFiles = await uploadFiles();
    RatingItemRequest itemRequest = RatingItemRequest(
      rating: quality.rating,
      ratingType: RatingType.quality,
    );
    ReviewTicketRequest params = ReviewTicketRequest(
      feedback: state.feedback,
      ratings: [itemRequest],
      reviewFiles: uploadedFiles,
    );

    final result = await ticketUsecase.reviewTicket(id, params);
    if (result) {
      isDone = true;
    }

    return isDone;
  }
}
