part of '../community_newsletter_details.dart';

class CommunityNewsletterDetailsView extends BaseWidget {
  final String? id;
  const CommunityNewsletterDetailsView({super.key, required this.id});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CommunityNewsletterDetailsCubit>().searchNewsDetails(id ?? "");
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<CommunityNewsletterDetailsCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colors.bgTextField,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Header(
            title: t.news_detail,
          )),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Colors.black,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title article
              Text(
                cubit.state.newsContent.title ?? "",
                style: AppTextStyle.s24w400cBlack
                    .copyWith(color: theme.colors.textTitle, fontWeight: FontWeight.w600),
              ),
              //person write the article
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      //avatar
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: theme.colors.gray400)),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          child: ImgNetWork(
                            width: 40,
                            url: cubit.state.newsContent.avatarFileUrl,
                            blankImage: AppImages.blankAvatar.assetName,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: cubit.state.newsContent.createdBy,
                          style: AppTextStyle.s12w400cBlack
                              .copyWith(color: theme.colors.textTitle, fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text:
                                  "\n${DateTimeUtils.timeStampToDate(cubit.state.newsContent.postAt)} - ${DateTimeUtils.timeStampToTime(cubit.state.newsContent.postAt)}",
                              style: AppTextStyle.s12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: theme.colors.textTitle,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),

              Divider(
                thickness: 1,
                color: theme.colors.gray400,
              ),
              Visibility(
                visible: !Utils.isNullOrEmpty(cubit.state.newsContent.description),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),

                    //summary
                    Text(
                      cubit.state.newsContent.description ?? "",
                      style: AppTextStyle.s16w400cBlack
                          .copyWith(color: theme.colors.textTitle, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              //content
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 16,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    // borderRadius: const BorderRadius.all(Radius.circular(8)),

                    child: ImgNetWork(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      url: cubit.state.newsContent.viewIllustrationUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //content
              Html(
                data: cubit.state.newsContent.content ?? "",
                style: {
                  'body': Style(
                    color: theme.colors.textTitle, fontSize: FontSize(16),
                    fontWeight: FontWeight.w400,
                    // fontStyle: FontStyle.normal,
                    padding: HtmlPaddings.zero,
                    margin: Margins(
                      bottom: Margin.zero(),
                      left: Margin.zero(),
                      top: Margin.zero(),
                      right: Margin.zero(),
                    ),
                  ),
                  'p': Style(
                    color: theme.colors.textTitle, fontSize: FontSize(16),
                    fontWeight: FontWeight.w400,
                    // fontStyle: FontStyle.normal,
                    padding: HtmlPaddings.zero,
                    margin: Margins(
                      bottom: Margin.zero(),
                      left: Margin.zero(),
                      top: Margin.zero(),
                      right: Margin.zero(),
                    ),
                  ),
                  'h2': Style(
                    color: theme.colors.textTitle, fontSize: FontSize(16),
                    fontWeight: FontWeight.w400,
                    // fontStyle: FontStyle.normal,
                    padding: HtmlPaddings.zero,
                    margin: Margins(
                      bottom: Margin.zero(),
                      left: Margin.zero(),
                      top: Margin.zero(),
                      right: Margin.zero(),
                    ),
                  )
                },
              ),
              Visibility(
                visible: !Utils.isNullOrEmpty(cubit.state.newsContent.files),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ListView.builder(
                    itemCount: cubit.state.newsContent.files != null
                        ? cubit.state.newsContent.files?.length
                        : 0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, idx) {
                      final data = cubit.state.newsContent.files![idx];
                      return GestureDetector(
                        onTap: () {
                          cubit.handlePreviewDocument(idx, context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
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
                                child: Text(
                                  data.originalName ?? '',
                                  style: AppTextStyle.s12.copyWith(color: theme.colors.primary),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
