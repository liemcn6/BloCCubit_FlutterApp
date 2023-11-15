import 'package:home_care/domain/repositories/news/community_newsletter_repo.dart';
import 'package:home_care/presentation/modules/home/models/lastest_news_model.dart';
import 'package:home_care/presentation/modules/home/models/news_model.dart';

class CommunityNewsletterUseCase {
  final CommunityNewsletterRepo _repo;

  CommunityNewsletterUseCase(this._repo);

  Future<List<String>> getBuilding() async {
    return await _repo.getBuilding();
  }

  Future<List<String>> getCategory(List<String> buildingIdList) async {
    return await _repo.getCategory(buildingIdList);
  }

  Future<List<NewsModel>> searchNews(List<String> buildingIdList) async {
    return await _repo.searchNews(buildingIdList);
  }

  Future<LastestNewsModel> searchNewDetails(String id) async {
    return await _repo.searchNewDetails(id);
  }

  Future<List<NewsModel>> searchNewsMostViewed() async {
    return await _repo.searchNewsMostViewed();
  }
}
