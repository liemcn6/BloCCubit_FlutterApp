part of 'review_ticket_cubit.dart';

class ReviewTicketState extends Equatable {
  final RatingItemRequest quality;
  final List<ImageModel> images;
  final String feedback;

  const ReviewTicketState({
    required this.quality,
    required this.images,
    required this.feedback,
  });

  @override
  List<Object> get props => [quality, images, feedback];

  ReviewTicketState copyWith({
    RatingItemRequest? quality,
    List<ImageModel>? images,
    String? feedback,
  }) {
    return ReviewTicketState(
      quality: quality ?? this.quality,
      images: images ?? this.images,
      feedback: feedback ?? this.feedback,
    );
  }
}

final class ReviewTicketInitial extends ReviewTicketState {
  ReviewTicketInitial()
      : super(
          quality: RatingItemRequest(),
          images: [],
          feedback: "",
        );
}
