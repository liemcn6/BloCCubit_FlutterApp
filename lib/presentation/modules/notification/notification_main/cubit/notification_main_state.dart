part of 'notification_main_cubit.dart';

class NotificationMainState extends Equatable {
  final List<NotificationModel> listNotification;
  final NotificationContentModel dataDetailNotification;
  final int countUnread;
  final int page;
  final bool enableLoadMore;
  final int pagesize;
  const NotificationMainState(
      {required this.countUnread,
      required this.dataDetailNotification,
      this.enableLoadMore = true,
      required this.listNotification,
      this.page = 1,
      this.pagesize = 30});

  @override
  List<Object> get props =>
      [countUnread, dataDetailNotification, enableLoadMore, listNotification, page, pagesize];

  NotificationMainState copyWith({
    final List<NotificationModel>? listNotification,
    final NotificationContentModel? dataDetailNotification,
    final int? countUnread,
    final int? page,
    final bool? enableLoadMore,
    final int? pagesize,
  }) {
    return NotificationMainState(
        countUnread: countUnread ?? this.countUnread,
        dataDetailNotification: dataDetailNotification ?? this.dataDetailNotification,
        listNotification: listNotification ?? this.listNotification,
        page: page ?? 1,
        enableLoadMore: enableLoadMore ?? true,
        pagesize: pagesize ?? 30);
  }
}

final class NotificationMainInitial extends NotificationMainState {
  NotificationMainInitial()
      : super(
          countUnread: 0,
          dataDetailNotification: NotificationContentModel(),
          listNotification: [],
          page: 1,
          pagesize: 30,
          enableLoadMore: true,
        );
}
