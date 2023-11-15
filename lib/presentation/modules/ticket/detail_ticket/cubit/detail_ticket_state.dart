part of 'detail_ticket_cubit.dart';

@immutable
class DetailTicketState extends Equatable {
  final String? status;
  final bool isUpdate;
  final RowItem building;
  final List<RowItem> floors;
  final int buildingSize;
  final int floorSize;
  final List<ImageModel> images;
  final String feedback;
  final RowItem company;
  final RowItem requester;
  final RowItem service;
  final RowItem assignee;
  final TicketItem detailTicket;
  final String content;
  final String note;
  final List<ImageModel> imagesAccept;
  final List<ImageModel> imagesConfirm;
  final bool isLoaded;

  // Profile
  final UserProfile? userProfile;
  final String userId;

  //check button type
  final String reviewButtonType;

  //review
  final ReviewResponse review;

  const DetailTicketState({
    this.status,
    this.isUpdate = false,
    this.building = const RowItem(),
    this.floors = const [],
    this.buildingSize = 0,
    this.floorSize = 0,
    this.images = const [],
    this.feedback = '',
    this.company = const RowItem(),
    this.requester = const RowItem(),
    this.service = const RowItem(),
    this.assignee = const RowItem(),
    this.detailTicket = const TicketItem(),
    this.content = '',
    this.note = '',
    this.imagesAccept = const [],
    this.imagesConfirm = const [],
    this.isLoaded = true,
    this.reviewButtonType = "",
    this.userId = "",
    this.userProfile,
    required this.review,
  });

  @override
  List<Object?> get props => [
        status,
        isUpdate,
        building,
        floors,
        buildingSize,
        floorSize,
        images,
        feedback,
        company,
        requester,
        service,
        assignee,
        detailTicket,
        content,
        note,
        imagesAccept,
        imagesConfirm,
        isLoaded,
        review,
        reviewButtonType,
        userProfile,
        userId,
      ];

  DetailTicketState copyWith({
    String? status,
    bool? isUpdate,
    RowItem? building,
    List<RowItem>? floors,
    int? buildingSize,
    int? floorSize,
    List<ImageModel>? images,
    String? feedback,
    RowItem? company,
    RowItem? requester,
    RowItem? service,
    RowItem? assignee,
    TicketItem? detailTicket,
    String? content,
    String? note,
    List<ImageModel>? imagesAccept,
    List<ImageModel>? imagesConfirm,
    bool? isLoaded,
    UserProfile? userProfile,
    String? userId,
    String? reviewButtonType,
    ReviewResponse? review,
  }) {
    return DetailTicketState(
      status: status ?? this.status,
      isUpdate: isUpdate ?? this.isUpdate,
      building: building ?? this.building,
      floors: floors ?? this.floors,
      buildingSize: buildingSize ?? this.buildingSize,
      floorSize: floorSize ?? this.floorSize,
      images: images ?? this.images,
      feedback: feedback ?? this.feedback,
      company: company ?? this.company,
      requester: requester ?? this.requester,
      service: service ?? this.service,
      assignee: assignee ?? this.assignee,
      detailTicket: detailTicket ?? this.detailTicket,
      content: content ?? this.content,
      note: note ?? this.note,
      imagesAccept: imagesAccept ?? this.imagesAccept,
      imagesConfirm: imagesConfirm ?? this.imagesConfirm,
      isLoaded: isLoaded ?? this.isLoaded,
      userId: userId ?? this.userId,
      userProfile: userProfile ?? this.userProfile,
      reviewButtonType: reviewButtonType ?? this.reviewButtonType,
      review: review ?? this.review,
    );
  }
}

final class DetailTicketInitial extends DetailTicketState {
  DetailTicketInitial() : super(review: ReviewResponse());
}
