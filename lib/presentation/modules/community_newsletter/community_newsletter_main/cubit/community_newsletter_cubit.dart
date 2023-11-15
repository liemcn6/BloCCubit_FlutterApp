import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/usecases/news/community_newsletter_usecase.dart';
import 'package:home_care/presentation/modules/home/models/news_model.dart';

part 'community_newsletter_state.dart';

class CommunityNewsletterCubit extends Cubit<CommunityNewsletterState> {
  CommunityNewsletterCubit() : super(CommunityNewsletterInitial());

  final _usecase = getIt.get<CommunityNewsletterUseCase>();

  //community newsletter model list
  List<NewsModel> communityNewsletterModelList = [];
  List<NewsModel> communityNewsletterModelListTotal = [];

  Future<void> init() async {
    if (isClosed) return;
    Utils.showLoading();
    await Future.wait([
      searchNews(showLoading: false),
      searchNewsMostViewed(showLoading: false),
    ]);
    Utils.hideLoading();
  }

  Future<void> changeCategory(String selectedCategoryInput) async {
    Utils.showLoading();

    communityNewsletterModelList.clear();

    for (var e in communityNewsletterModelListTotal) {
      if (e.catalogName == selectedCategoryInput) {
        communityNewsletterModelList.add(e);
      }
    }

    emit(state.copyWith(
        communityNewsletterModelList: communityNewsletterModelList,
        selectedCategory: selectedCategoryInput));
    Utils.hideLoading();
  }

  Future<void> searchNews({bool showLoading = true}) async {
    if (showLoading) Utils.showLoading();

    List<String> buildingIdList = await _usecase.getBuilding();
    List<String> categoryList = await _usecase.getCategory(buildingIdList);
    communityNewsletterModelListTotal = await _usecase.searchNews(buildingIdList);

    for (var e in communityNewsletterModelListTotal) {
      if (e.catalogName == categoryList.first) {
        communityNewsletterModelList.add(e);
      }
    }
    emit(state.copyWith(
        categoryList: categoryList,
        selectedCategory: categoryList.first,
        communityNewsletterModelList: communityNewsletterModelList));
    if (showLoading) Utils.hideLoading();
  }

  Future<void> searchNewsMostViewed({bool showLoading = true}) async {
    if (showLoading) Utils.showLoading();

    List<NewsModel> communityMostViewedNewsletterList = await _usecase.searchNewsMostViewed();
    emit(state.copyWith(
      mostViewedNewsletterModelList: communityMostViewedNewsletterList,
      isLoading: false,
    ));

    if (showLoading) Utils.hideLoading();
  }
}
