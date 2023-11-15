part of '../notification_main_screen.dart';

class NotificationMainView extends BaseWidget {
  const NotificationMainView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationMainCubit>().requestNotification();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<NotificationMainCubit>();
    ScrollController? scrollController;

    return WillPopScope(
      onWillPop: () async {
        appController.requestCountUnread();
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: theme.colors.newBackgroundColor,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(Dimension.padding56),
              child: Header(
                onPressed: () {
                  appController.requestCountUnread();
                  Navigator.of(context).pop();
                },
                visibleBack: true,
                title: t.notification,
              )),
          body: RefreshIndicator(
            onRefresh: cubit.onRefresh,
            child: ListWidget(
              scrollController: scrollController,
              margin: const EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) {
                NotificationModel item = cubit.state.listNotification[index];
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 16,
                    color: theme.colors.newBackgroundColor,
                  ))),
                  child: Slidable(
                    key: ValueKey(item.id),
                    endActionPane: ActionPane(
                      extentRatio: 0.15,
                      motion: const DrawerMotion(),
                      children: [
                        //delete icon slieable
                        SlidableActionWidget(
                          onPressed: (context) =>
                              cubit.handleOnDelete(context, item.id, index, theme),
                          backgroundColor: theme.colors.red,
                          foregroundColor: theme.colors.white,
                          icon: AppSvgs.icDelete,
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () => cubit.onPressItem(item, index),
                      child: Container(
                        decoration: BoxDecoration(
                            color: theme.colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(8))),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: cubit.state.listNotification[index].isRead == false
                                  ? AppTextStyle.s14.copyWith(
                                      color: theme.colors.textTitle, fontWeight: FontWeight.w600)
                                  : AppTextStyle.s14.copyWith(
                                      color: theme.colors.colorNeutral10,
                                      fontWeight: FontWeight.w400,
                                    ),
                            ),
                            const SizedBox(height: Dimension.padding8),
                            Expanded(
                              flex: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Dimension.padding6,
                                      vertical: Dimension.padding4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(99),
                                      color: theme.colors.green1,
                                    ),
                                    child: Text(
                                      item.contentType == 'JSON'
                                          ? DataType.dataContent(
                                              lang: t,
                                              status: item.contentJson?.dataType,
                                            )
                                          : t.system,
                                      style: AppTextStyle.s10w400cBlack.copyWith(
                                          color: theme.colors.primary, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateTimeUtils.fomatHourDateMonth(item.createdAt),
                                    style: AppTextStyle.s12.copyWith(color: theme.colors.neutral10),
                                  ),
                                  if (item.isRead == false) ...[
                                    const SizedBox(width: Dimension.padding6),
                                    Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: theme.colors.primary,
                                    ),
                                  ] else
                                    ...[],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: cubit.state.listNotification.length,
              onLoadMore: cubit.onLoadMore,
              enableLoadMore: cubit.state.enableLoadMore,
            ),
          )),
    );
  }
}
