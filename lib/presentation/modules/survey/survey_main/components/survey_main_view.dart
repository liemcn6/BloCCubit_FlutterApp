part of '../survey_main_screen.dart';

class SurveyMainView extends BaseWidget {
  const SurveyMainView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SurveyMainCubit>().requestListSurvey();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;

    final cubit = context.watch<SurveyMainCubit>();
    ScrollController? scrollController;
    return Scaffold(
      backgroundColor: theme.colors.newBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Dimension.padding56),
        child: Header(
          title: t.listSurvey,
          visibleBack: false,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return RefreshIndicator(
            onRefresh: cubit.onRefresh,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                maxHeight: constraints.maxHeight,
              ),
              child: ListWidget(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                scrollController: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return CardView(
                    color: theme.colors.white,
                    margin: const EdgeInsets.only(
                      top: Dimension.padding16,
                      right: Dimension.padding16,
                      left: Dimension.padding16,
                    ),
                    padding: const EdgeInsets.all(Dimension.padding16),
                    radius: Dimension.padding6,
                    onTap: () async {
                      if (cubit.state.listSurvey[index].surveyId != null &&
                          cubit.state.listSurvey[index].buildingId != null) {
                        final result = await AppNavigator.push(Routes.surveyDetail, {
                          "id": cubit.state.listSurvey[index].surveyId,
                          "buildingId": cubit.state.listSurvey[index].buildingId,
                        });
                        if (result) {
                          cubit.onRefresh();
                        }
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: cubit.state.listSurvey[index].name != null
                              ? Text(
                                  cubit.state.listSurvey[index].name ?? '',
                                  style:
                                      AppTextStyle.s14bold.copyWith(color: theme.colors.secondGrey),
                                )
                              : const SizedBox(),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.only(top: Dimension.margin8),
                          child: Text(
                            '${DateTimeUtils.timeStampToDate(cubit.state.listSurvey[index].startAt)} - ${DateTimeUtils.timeStampToDate(cubit.state.listSurvey[index].endAt)}',
                            style: AppTextStyle.s12.copyWith(color: theme.colors.secondGrey),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: cubit.state.listSurvey.length,
                onLoadMore: cubit.onLoadMore,
                enableLoadMore: cubit.enableLoadMore,
              ),
            ),
          );
        },
      ),
    );
  }
}
