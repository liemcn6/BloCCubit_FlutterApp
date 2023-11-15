part of '../notification_details_screen.dart';

class NotificationDetailView extends BaseWidget {
  const NotificationDetailView({
    super.key,
    this.eventId,
  });

  final String? eventId;

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationDetailsCubit>().requestDetailNotification(eventId);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<NotificationDetailsCubit>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Header(
              visibleBack: true,
              title: t.detail_notification,
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  cubit.state.dataDetailNotification.title ?? '',
                  style: AppTextStyle.s20w600.copyWith(color: theme.colors.neutral13),
                ),
              ),
              html.Html(
                data: cubit.state.dataDetailNotification.content ?? '',
                style: {
                  "body": Style(
                    fontSize: FontSize(14),
                    fontWeight: FontWeight.w400,
                    color: theme.colors.neutral13,
                  )
                },
                onLinkTap: (url, attributes, element) {
                  if (url != null && url.isNotEmpty) {
                    final Uri uri = Uri.parse(url);
                    launchUrl(uri);
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              cubit.state.dataDetailNotification.attachFiles != null
                  ? Column(
                      children: cubit.state.dataDetailNotification.attachFiles!.map((data) {
                      return GestureDetector(
                        onTap: () {
                          // handleOnDownloadPdf(data.viewUrl);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              const SizedBox(width: 8),
                              Icon(
                                Icons.attach_file,
                                size: 20,
                                color: theme.colors.colorFF00000,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: Text(data.originalName ?? '',
                                    style: AppTextStyle.s12.copyWith(color: theme.colors.primary)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList())
                  : const SizedBox(),
            ]),
          ),
        ));
  }
}
