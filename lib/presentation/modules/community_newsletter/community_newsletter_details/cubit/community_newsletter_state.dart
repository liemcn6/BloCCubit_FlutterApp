part of 'community_newsletter_cubit.dart';

class CommunityNewsletterDetailsState extends Equatable {
  final LastestNewsModel newsContent;

  const CommunityNewsletterDetailsState({
    required this.newsContent,
  });

  @override
  List<Object> get props => [
        newsContent,
      ];

  CommunityNewsletterDetailsState copyWith({
    LastestNewsModel? newsContent,
  }) {
    return CommunityNewsletterDetailsState(
      newsContent: newsContent ?? this.newsContent,
    );
  }
}

final class CommunityNewsletterDetailsInitial extends CommunityNewsletterDetailsState {
  CommunityNewsletterDetailsInitial() : super(newsContent: LastestNewsModel());
}
