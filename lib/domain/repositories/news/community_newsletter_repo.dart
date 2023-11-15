import 'package:home_care/presentation/modules/home/models/lastest_news_model.dart';
import 'package:home_care/presentation/modules/home/models/news_model.dart';

mixin CommunityNewsletterRepo {
  Future<List<String>> getBuilding();

  Future<List<String>> getCategory(List<String> buildingIdList);

  Future<List<NewsModel>> searchNews(List<String> buildingIdList);

  Future<LastestNewsModel> searchNewDetails(String id);

  Future<List<NewsModel>> searchNewsMostViewed();
}
