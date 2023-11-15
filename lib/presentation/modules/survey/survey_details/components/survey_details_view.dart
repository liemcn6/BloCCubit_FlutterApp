part of '../survey_details_screen.dart';

class SurveyDetailsView extends BaseWidget {
  final String? id;
  final String? buildingId;

  const SurveyDetailsView({super.key, this.id, this.buildingId});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SurveyDetailsCubit>().requestDetailSurvey(id, buildingId, context);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<SurveyDetailsCubit>();

    return WillPopScope(
      onWillPop: () async {
        AppNavigator.pop(true);
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(Dimension.padding56),
            child: Header(
              title: t.survey,
              visibleBack: true,
              onPressed: () {
                AppNavigator.pop(true);
              },
              actions: const [
                IconHome(),
              ],
            )),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AppImages.bgApp, fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.only(left: Dimension.padding16, right: Dimension.padding16),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimension.padding120, bottom: Dimension.padding80),
                      child: Image.asset(
                        AppImages.appLogo.assetName,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          cubit.state.detail.name ?? '',
                          style: AppTextStyle.s16w600,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: Dimension.margin20),
                          child: ReadMoreText(
                            cubit.parseHtmlString(cubit.state.detail.introduction ?? ''),
                            textAlign: TextAlign.justify,
                            trimLines: 5,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: t.show_more,
                            moreStyle: AppTextStyle.s14w600.copyWith(color: theme.colors.showMore),
                            lessStyle: AppTextStyle.s14w600.copyWith(color: theme.colors.showMore),
                            style: AppTextStyle.s14w400,
                            trimExpandedText: ' ${t.show_less}',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CardView(
                color: theme.colors.primary,
                title: t.start_survey,
                margin: const EdgeInsets.only(
                    left: Dimension.margin16,
                    right: Dimension.margin16,
                    bottom: Dimension.margin20),
                onTap: () async {
                  final result = await AppNavigator.push(
                      Routes.surveyDo, {"id": id, "buildingId": buildingId});
                  if (result) {
                    // ignore: use_build_context_synchronously
                    cubit.requestDetailSurvey(id, buildingId, context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
