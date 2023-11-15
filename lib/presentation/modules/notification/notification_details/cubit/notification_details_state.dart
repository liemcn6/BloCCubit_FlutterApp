part of 'notification_details_cubit.dart';

class NotificationDetailsState extends Equatable {
  final NotificationModel dataDetailNotification;

  const NotificationDetailsState({
    required this.dataDetailNotification,
  });

  @override
  List<Object> get props => [dataDetailNotification];

  NotificationDetailsState copyWith({
    final NotificationModel? dataDetailNotification,
  }) {
    return NotificationDetailsState(
        dataDetailNotification: dataDetailNotification ?? this.dataDetailNotification);
  }
}

final class NotificationDetailsInitial extends NotificationDetailsState {
  NotificationDetailsInitial() : super(dataDetailNotification: NotificationModel());
}
