part of '../review_ticket_screen.dart';

class ReviewTicketView extends BaseWidget {
  const ReviewTicketView({
    super.key,
    required this.ticketId,
    required this.review,
    required this.isReviewed,
  });

  final String ticketId;
  final ReviewResponse? review;
  final bool? isReviewed;

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<ReviewTicketCubit>();
    // final GlobalKey<FormState> formKeyRT = GlobalKey<FormState>();

    return WillPopScope(
      onWillPop: () async {
        AppNavigator.pop(true);
        return true;
      },
      child: Scaffold(
        backgroundColor: theme.colors.newBackgroundColor,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Header(
            title: t.requestReview,
            visibleBack: true,
            onPressed: () {
              AppNavigator.pop(true);
            },
            actions: const [
              IconHome(),
            ],
          ),
        ),
        body: Form(
          // key: formKeyRT,
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: cubit.handlerRefresh,
                  child: ListView(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      renderBody(context, data, appController, t, cubit),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isReviewed ?? false,
                child: bottomReviewButtons(context, data, appController, t, cubit),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderHeaderBody(BuildContext context, data, AppCubit appController, AppLocalizations t,
      ReviewTicketCubit cubit) {
    final theme = appController.state.theme;
    final TicketBase ticketWidget = TicketBase(
      theme: theme,
      baseContext: context,
      lang: t,
      width: DeviceUtils.getWidth(context),
    );
    return CardView(
      color: Colors.transparent,
      margin: const EdgeInsets.all(Dimension.margin16),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  t.processingQuality,
                  style: AppTextStyle.s14,
                ),
              ),
              ticketWidget.starRatingRow(
                selectPos: (isReviewed ?? false)
                    ? cubit.state.quality.rating
                    : review!.ratings!.first.rating,
                onTap: isReviewed ?? false
                    ? (pos) {
                        cubit.changeQualityRating(pos);
                      }
                    : null,
              ),
            ],
          ),
          const SizedBox(height: Dimension.padding16),
        ],
      ),
    );
  }

  //render body
  Widget renderBody(BuildContext context, data, AppCubit appController, AppLocalizations t,
      ReviewTicketCubit cubit) {
    if (isReviewed == true) {
      return renderEditBody(context, data, appController, t, cubit);
    }
    return renderViewBody(context, data, appController, t, cubit);
  }

  Widget renderEditBody(BuildContext context, data, AppCubit appController, AppLocalizations t,
      ReviewTicketCubit cubit) {
    final theme = appController.state.theme;
    final TicketBase ticketWidget = TicketBase(
      theme: theme,
      baseContext: context,
      lang: t,
      width: DeviceUtils.getWidth(context),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderHeaderBody(context, data, appController, t, cubit),
        const SizedBox(height: Dimension.padding16),
        ticketWidget.imageAddListView(
          title: t.attachPictures,
          images: cubit.state.images,
          onTapCamera: () {
            cubit.onTapCamera();
          },
          onTapGallery: () {
            cubit.onTapGallery();
          },
          onDel: (i) {
            cubit.delImage(i);
          },
        ),
        const SizedBox(height: Dimension.padding8),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.padding16,
            vertical: Dimension.padding4,
          ),
          child: Text(
            t.comment,
            style: AppTextStyle.s14w400,
          ),
        ),
        TextsField(
          theme: theme,
          margin: const EdgeInsets.symmetric(horizontal: Dimension.padding16),
          controller: cubit.feedbackCtrl,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          borderType: BorderTypes.all,
          minLines: 5,
          maxLines: 6,
          maxLength: 1000,
          onChanged: (val) {
            cubit.changeFeedback(val);
          },
          hintText: t.comment,
          hintStyle: AppTextStyle.s16w400.copyWith(color: theme.colors.gray700),
        ),
      ],
    );
  }

  Widget renderViewBody(BuildContext context, data, AppCubit appController, AppLocalizations t,
      ReviewTicketCubit cubit) {
    final theme = appController.state.theme;

    return Column(
      children: [
        renderHeaderBody(context, data, appController, t, cubit),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimension.padding16),
          child: Column(
            children: [
              imageListView(
                  theme: theme,
                  images: cubit.state.images,
                  noTopBorder: true,
                  title: t.review_document,
                  context: context,
                  data: data,
                  appController: appController,
                  t: t,
                  cubit: cubit),
              Visibility(
                visible: !Utils.isNullOrEmpty(review?.feedback),
                child: itemView(
                  theme: theme,
                  title: t.comment,
                  value: review?.feedback ?? "",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget imageListView(
      {String? title,
      required List<ImageModel> images,
      bool noTopBorder = false,
      required AppTheme theme,
      required BuildContext context,
      data,
      required AppCubit appController,
      required AppLocalizations t,
      required ReviewTicketCubit cubit}) {
    final TicketBase ticketWidget = TicketBase(
      theme: theme,
      baseContext: context,
      lang: t,
      width: DeviceUtils.getWidth(context),
    );
    return Visibility(
      visible: !Utils.isNullOrEmpty(images),
      child: itemView(
        theme: theme,
        noTopBorder: noTopBorder,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? t.image,
              style: AppTextStyle.s12.copyWith(color: theme.colors.gray700),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: Dimension.h8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < images.length; i++)
                    ticketWidget.imageView(
                      image: images[i],
                      pos: i,
                      onTap: () {
                        // showPreviewImageList(
                        //   images: images,
                        //   context: baseContext,
                        //   initialPage: i,
                        // );
                      },
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemView(
      {String title = '',
      String value = '',
      bool noTopBorder = false,
      Widget? child,
      double distanceItem = Dimension.padding12,
      required AppTheme theme}) {
    return Container(
      decoration: noTopBorder
          ? const BoxDecoration()
          : BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: theme.colors.border),
              ),
            ),
      margin: EdgeInsets.only(bottom: distanceItem),
      // width: DeviceUtils.getWidth(context),
      padding: EdgeInsets.only(top: distanceItem),
      child: child ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.s12.copyWith(color: theme.colors.gray700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(top: Dimension.padding4),
                child: Text(
                  value,
                  style: AppTextStyle.s16w400,
                ),
              ),
            ],
          ),
    );
  }

  //render review bottom review button
  Widget bottomReviewButtons(BuildContext context, data, AppCubit appController, AppLocalizations t,
      ReviewTicketCubit cubit) {
    final theme = appController.state.theme;

    return CardView(
      onTap: () {
        cubit.sendReview(
          context: context,
          theme: theme,
          lang: t,
          id: ticketId,
        );
      },
      title: t.submitReview,
      margin: const EdgeInsets.only(
        top: Dimension.margin8,
        bottom: Dimension.margin24,
        right: Dimension.margin16,
        left: Dimension.margin16,
      ),
    );
  }
}
