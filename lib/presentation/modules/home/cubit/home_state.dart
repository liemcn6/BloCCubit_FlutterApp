part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<HomeModel> listScreen;

  //news
  final List<String> buildingIdList;
  final List<NewsModel> communityNewsletterModelList;
  final List<NewsModel> mostViewedNewsletterModelList;
  final bool isMostViewLoading;
  final bool isNewsLoading;
  final bool isNewsViewed;
  //notification
  final int countUnread;

  // Profile
  final UserProfile userProfile;

  final bool isAccessLimited;

  const HomeState({
    required this.listScreen,
    required this.buildingIdList,
    required this.communityNewsletterModelList,
    required this.mostViewedNewsletterModelList,
    this.countUnread = 0,
    required this.userProfile,
    this.isMostViewLoading = true,
    this.isNewsLoading = true,
    this.isAccessLimited = false,
    this.isNewsViewed = true,
  });

  @override
  List<Object> get props => [
        listScreen,
        buildingIdList,
        communityNewsletterModelList,
        mostViewedNewsletterModelList,
        countUnread,
        userProfile,
        isMostViewLoading,
        isNewsLoading,
        isAccessLimited,
        isNewsViewed,
      ];

  HomeState copyWith({
    List<HomeModel>? listScreen,
    List<String>? buildingIdList,
    List<NewsModel>? communityNewsletterModelList,
    List<NewsModel>? mostViewedNewsletterModelList,
    int? countUnread,
    UserProfile? userProfile,
    bool? isMostViewLoading,
    bool? isNewsLoading,
    bool? isAccessLimited,
    bool? isNewsViewed,
  }) {
    return HomeState(
        listScreen: listScreen ?? this.listScreen,
        buildingIdList: buildingIdList ?? this.buildingIdList,
        communityNewsletterModelList:
            communityNewsletterModelList ?? this.communityNewsletterModelList,
        mostViewedNewsletterModelList:
            mostViewedNewsletterModelList ?? this.mostViewedNewsletterModelList,
        countUnread: countUnread ?? this.countUnread,
        userProfile: userProfile ?? this.userProfile,
        isMostViewLoading: isMostViewLoading ?? this.isMostViewLoading,
        isNewsLoading: isNewsLoading ?? this.isNewsLoading,
        isAccessLimited: isAccessLimited ?? this.isAccessLimited,
        isNewsViewed: isNewsViewed ?? this.isNewsViewed);
  }
}

final class HomeInitial extends HomeState {
  HomeInitial()
      : super(
          listScreen: [],
          buildingIdList: [],
          communityNewsletterModelList: [],
          mostViewedNewsletterModelList: [],
          userProfile: const UserProfile(),
          isMostViewLoading: true,
          isNewsLoading: true,
          isNewsViewed: true,
        );
}
