import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/file/illustration_file.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/usecases/news/community_newsletter_usecase.dart';
import 'package:home_care/presentation/modules/home/models/lastest_news_model.dart';
import 'package:home_care/presentation/widgets/file_preview.dart';

part 'community_newsletter_state.dart';

class CommunityNewsletterDetailsCubit extends Cubit<CommunityNewsletterDetailsState> {
  CommunityNewsletterDetailsCubit() : super(CommunityNewsletterDetailsInitial());

  final _usecase = getIt.get<CommunityNewsletterUseCase>();

  Future<void> searchNewsDetails(String id) async {
    Utils.showLoading();
    LastestNewsModel newsContent = await _usecase.searchNewDetails(id);
    emit(state.copyWith(newsContent: newsContent));
    Utils.hideLoading();
  }

  void handlePreviewDocument(int idx, BuildContext context) async {
    await showFilePreviewList(
      context: context,
      initialPage: idx,
      files: state.newsContent.files
              ?.map(
                (data) => ImageModel(
                  networkData: IllustrationFile(
                    downloadUrl: data.downloadUrl,
                    originalName: data.originalName,
                    fileId: data.id,
                    viewUrl: data.viewUrl,
                  ),
                  type: ImageType.network,
                ),
              )
              .toList() ??
          [],
    );
  }
}
