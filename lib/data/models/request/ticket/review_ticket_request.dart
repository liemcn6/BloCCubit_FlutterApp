class ReviewTicketRequest {
  final String? feedback;
  final List<RatingItemRequest>? ratings;
  final List<String>? reviewFiles;

  ReviewTicketRequest({
    this.feedback,
    this.ratings,
    this.reviewFiles,
  });

  factory ReviewTicketRequest.fromJson(Map<String, dynamic> json) {
    return ReviewTicketRequest(
      feedback: json['feedback'],
      ratings: (json['ratings'] as List<dynamic>)
          .map((item) => RatingItemRequest.fromJson(item))
          .toList(),
      reviewFiles: List<String>.from(json['reviewFiles']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedback': feedback,
      'ratings': ratings?.map((item) => item.toJson()).toList(),
      'reviewFiles': reviewFiles,
    };
  }
}

class RatingItemRequest {
  int? rating;
  final String? ratingType; //QUALITY, SPEED

  RatingItemRequest({
    this.rating,
    this.ratingType,
  });

  factory RatingItemRequest.fromJson(Map<String, dynamic> json) {
    return RatingItemRequest(
      rating: json['rating'],
      ratingType: json['ratingType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'ratingType': ratingType,
    };
  }
}
