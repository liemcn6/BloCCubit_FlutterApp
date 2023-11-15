part of 'create_ticket_cubit.dart';

class CreateTicketState extends Equatable {
  final List<ImageModel> images;

  final RowItem building;

  final int buildingsSize;

  final List<RowItem> floors;

  final int floorSize;
  final bool isLoaded;
  final String content;

  const CreateTicketState({
    this.images = const [],
    this.building = const RowItem(),
    this.buildingsSize = 0,
    this.floors = const [],
    this.floorSize = 0,
    this.isLoaded = true,
    this.content = '',
  });

  CreateTicketState copyWith({
    List<ImageModel>? images,
    RowItem? building,
    int? buildingsSize,
    List<RowItem>? floors,
    int? floorSize,
    bool? isLoaded,
    String? content,
  }) {
    return CreateTicketState(
      images: images ?? this.images,
      building: building ?? this.building,
      buildingsSize: buildingsSize ?? this.buildingsSize,
      floors: floors ?? this.floors,
      floorSize: floorSize ?? this.floorSize,
      isLoaded: isLoaded ?? this.isLoaded,
      content: content ?? this.content,
    );
  }

  @override
  List<Object> get props => [
        images,
        building,
        buildingsSize,
        floors,
        floorSize,
        isLoaded,
        content,
      ];
}

final class CreateTicketInitial extends CreateTicketState {}
