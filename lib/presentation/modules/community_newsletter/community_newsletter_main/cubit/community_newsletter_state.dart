part of 'community_newsletter_cubit.dart';

class CommunityNewsletterState extends Equatable {
  //list

  final List<String> buildingIdList;
  final List<NewsModel> communityNewsletterModelList;

  final List<NewsModel> mostViewedNewsletterModelList;

  final bool isLoading;

  //category
  final List<String> categoryList;
  final String selectedCategory;
  const CommunityNewsletterState({
    required this.buildingIdList,
    required this.categoryList,
    required this.communityNewsletterModelList,
    required this.mostViewedNewsletterModelList,
    required this.selectedCategory,
    this.isLoading = true,
  });

  @override
  List<Object> get props => [
        buildingIdList,
        categoryList,
        communityNewsletterModelList,
        mostViewedNewsletterModelList,
        selectedCategory,
        isLoading,
      ];

  CommunityNewsletterState copyWith({
    List<String>? buildingIdList,
    List<NewsModel>? communityNewsletterModelList,
    List<NewsModel>? mostViewedNewsletterModelList,
    bool? isLoading,
    // category
    List<String>? categoryList,
    String? selectedCategory,
  }) {
    return CommunityNewsletterState(
      buildingIdList: buildingIdList ?? this.buildingIdList,
      categoryList: categoryList ?? this.categoryList,
      communityNewsletterModelList:
          communityNewsletterModelList ?? this.communityNewsletterModelList,
      mostViewedNewsletterModelList:
          mostViewedNewsletterModelList ?? this.mostViewedNewsletterModelList,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class CommunityNewsletterInitial extends CommunityNewsletterState {
  CommunityNewsletterInitial()
      : super(
          buildingIdList: [],
          categoryList: [],
          communityNewsletterModelList: [],
          mostViewedNewsletterModelList: [],
          selectedCategory: "",
          isLoading: false,
        );
}
