import 'package:home_care/data/models/response/ticket/illustration_file_response.dart';

class ReviewResponse {
  String? createdUserId;
  String? id;
  String? createdBy;
  int? createdAt;
  String? feedback;
  bool? deleted;
  String? lastModifiedBy;
  int? lastModifiedAt;
  String? ticketId;
  List<Rating>? ratings;
  List<IllustrationsFileResponse>? reviewFiles;

  ReviewResponse({
    this.createdUserId,
    this.ratings,
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.reviewFiles,
    this.ticketId,
    this.deleted,
    this.feedback,
  });

  factory ReviewResponse.fromJson(Map<String, dynamic> json) => ReviewResponse(
        createdUserId: json['createdUserId'],
        createdBy: json['createdBy'],
        createdAt: json['createdAt'],
        lastModifiedBy: json['lastModifiedBy'],
        lastModifiedAt: json['lastModifiedAt'],
        id: json['id'],
        ticketId: json['ticketId'],
        deleted: json['deleted'],
        feedback: json['feedback'],
        ratings: json['ratings'] != null
            ? List<Rating>.from(json['ratings'].map((x) => Rating.fromJson(x)))
            : null,
        reviewFiles: json['reviewFiles'] != null
            ? List<IllustrationsFileResponse>.from(
                json['reviewFiles'].map((x) => IllustrationsFileResponse.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'createdUserId': createdUserId,
        'createdBy': createdBy,
        'createdAt': createdAt,
        'lastModifiedBy': lastModifiedBy,
        'lastModifiedAt': lastModifiedAt,
        'id': id,
        'ticketId': ticketId,
        'deleted': deleted,
        'feedback': feedback,
        'ratings': ratings != null ? List<dynamic>.from(ratings!.map((x) => x.toJson())) : null,
        'reviewFiles':
            reviewFiles != null ? List<dynamic>.from(reviewFiles!.map((x) => x.toJson())) : null,
      };
}

class Rating {
  String? createdUserId;
  String? id;
  String? createdBy;
  int? createdAt;
  String? lastModifiedBy;
  int? lastModifiedAt;
  String? ticketId;
  String? ticketReviewId;
  int? rating;
  String? ratingType; //QUALITY, SPEED

  Rating({
    this.createdUserId,
    this.rating,
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.ticketId,
    this.ticketReviewId,
    this.ratingType,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        createdUserId: json['createdUserId'],
        rating: json['rating'],
        createdBy: json['createdBy'],
        createdAt: json['createdAt'],
        lastModifiedBy: json['lastModifiedBy'],
        lastModifiedAt: json['lastModifiedAt'],
        id: json['id'],
        ticketId: json['ticketId'],
        ticketReviewId: json['ticketReviewId'],
        ratingType: json['ratingType'],
      );

  Map<String, dynamic> toJson() => {
        'createdUserId': createdUserId,
        'rating': rating,
        'createdBy': createdBy,
        'createdAt': createdAt,
        'lastModifiedBy': lastModifiedBy,
        'lastModifiedAt': lastModifiedAt,
        'id': id,
        'ticketId': ticketId,
        'ticketReviewId': ticketReviewId,
        'ratingType': ratingType,
      };
}
