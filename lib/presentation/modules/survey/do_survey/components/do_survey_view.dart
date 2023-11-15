part of '../do_survey_screen.dart';

class DoSurveyView extends BaseWidget {
  final String? id;
  final String? buildingId;

  const DoSurveyView({super.key, this.id, this.buildingId});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DoSurveyCubit>().requestDetailSurvey(id, buildingId);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<DoSurveyCubit>();
    return Scaffold(
      backgroundColor: theme.colors.newBackgroundColor,
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimension.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cubit.state.detail.name ?? '',
              style: AppTextStyle.s20w600.copyWith(color: theme.colors.textTitle),
            ),
            Padding(
              padding: const EdgeInsets.only(top: Dimension.padding16, bottom: Dimension.padding16),
              child: surveyProgressWidget(appController, cubit),
            ),
            Expanded(
              flex: 1,
              child: GroupedListView(
                physics: const BouncingScrollPhysics(),
                elements: cubit.state.detail.surveyTemplate?.questions ?? [],
                groupBy: (element) => element.questionGroupName,
                sort: false,
                indexedItemBuilder: (context, element, index) {
                  if (index != cubit.state.detail.surveyTemplate!.questions!.length - 1) {
                    return (surveyQuestionWidget(appController, t, element, index, cubit));
                  } else {
                    return Column(
                      children: [
                        surveyQuestionWidget(
                          appController,
                          t,
                          element,
                          index,
                          cubit,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          t.ideaSurvey,
                          style: AppTextStyle.s12,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: Dimension.padding10,
                          ),
                          child: TextsField(
                            margin: const EdgeInsets.all(0),
                            controller: cubit.state.feedBack,
                            theme: theme,
                            hintText: t.inputContent,
                            maxLines: 5,
                            maxLength: 1000,
                            visibleMaxLengthText: false,
                            borderColor: theme.colors.border,
                            borderType: BorderTypes.all,
                          ),
                        ),
                        CardView(
                          disable: cubit.answerList.any((e) => Utils.isNullOrEmpty(e.numberAnswer)),
                          color: theme.colors.primary,
                          title: t.sendSurvey,
                          margin: const EdgeInsets.only(
                            bottom: Dimension.margin12,
                            top: Dimension.margin16,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (buildContext) {
                                return DialogCustom(
                                  content: t.confirm_survey,
                                  title: t.notify,
                                  textBtnAccept: t.confirm,
                                  showBtnCancel: true,
                                  onPressBtnAccept: () {
                                    cubit.requestDoSurvey(context, theme);
                                  },
                                  textBtnCancel: t.close,
                                  onPressBtnCancel: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            );
                          },
                        ),
                        CardView(
                          border: Border.all(
                            width: Dimension.divideHeight,
                            color: theme.colors.neutral3,
                          ),
                          color: theme.colors.white,
                          title: t.cancel,
                          titleStyle: AppTextStyle.s14
                              .copyWith(color: theme.colors.neutral10, fontWeight: FontWeight.w600),
                          margin: const EdgeInsets.only(
                            bottom: Dimension.margin20,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (buildContext) {
                                return DialogCustom(
                                  content: t.cancelSurvey,
                                  title: t.notify,
                                  textBtnAccept: t.agree,
                                  onPressBtnAccept: () {
                                    AppNavigator.pop(true);
                                  },
                                  showBtnCancel: true,
                                  textBtnCancel: t.close,
                                  onPressBtnCancel: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            );
                          },
                        )
                      ],
                    );
                  }
                },
                groupSeparatorBuilder: (String groupByValue) => Padding(
                  padding: const EdgeInsets.only(bottom: Dimension.padding6),
                  child: Text(
                    groupByValue,
                    style: AppTextStyle.s14.copyWith(color: theme.colors.textValue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //survey progress
  Widget surveyProgressWidget(AppCubit appController, DoSurveyCubit cubit) {
    final theme = appController.state.theme;
    return Row(
        children: cubit.answerList.isNotEmpty
            ? cubit.answerList
                .asMap()
                .map(
                  (key, value) => MapEntry(
                    key,
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: value.numberAnswer == null
                            ? theme.colors.progressBlank
                            : theme.colors.primary,
                        width: double.infinity,
                        height: Dimension.h4,
                        margin: const EdgeInsets.only(left: 1, right: 1),
                      ),
                    ),
                  ),
                )
                .values
                .toList()
            : []);
  }

  //survey question
  Widget surveyQuestionWidget(AppCubit appController, AppLocalizations t, QuestionsModel listGroup,
      int index, DoSurveyCubit cubit) {
    final theme = appController.state.theme;
    return Container(
      margin: const EdgeInsets.only(top: Dimension.padding6, bottom: Dimension.padding6),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(Dimension.padding6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimension.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [radioGroupAnswerWidget(appController, t, listGroup, index, cubit)],
        ),
      ),
    );
  }

  //survey radio answer
  Widget radioGroupAnswerWidget(AppCubit appController, AppLocalizations t, QuestionsModel data,
      int index, DoSurveyCubit cubit) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${index + 1}. ${data.content}',
          style: AppTextStyle.s14bold,
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimension.padding12),
          child: RadioButton(
            isSelected: cubit.state.answer[index].numberAnswer == 5,
            value: 5,
            onChange: (bool isSelected, int num) {
              cubit.setAnswer(
                data.id,
                5,
                t.veryGood,
              );
            },
            shape: BoxShape.circle,
            title: t.veryGood,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimension.padding12),
          child: RadioButton(
            isSelected: cubit.state.answer[index].numberAnswer == 4,
            value: 4,
            onChange: (bool isSelected, int num) {
              cubit.setAnswer(
                data.id,
                4,
                t.good,
              );
            },
            shape: BoxShape.circle,
            title: t.good,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimension.padding12),
          child: RadioButton(
            isSelected: cubit.state.answer[index].numberAnswer == 3,
            value: 3,
            onChange: (bool isSelected, int num) {
              cubit.setAnswer(
                data.id,
                3,
                t.least_value,
              );
            },
            shape: BoxShape.circle,
            title: t.acceptable,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimension.padding12),
          child: RadioButton(
            isSelected: cubit.state.answer[index].numberAnswer == 2,
            value: 2,
            onChange: (bool isSelected, int num) {
              cubit.setAnswer(
                data.id,
                2,
                t.medium,
              );
            },
            shape: BoxShape.circle,
            title: t.medium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimension.padding12),
          child: RadioButton(
            isSelected: cubit.state.answer[index].numberAnswer == 1,
            value: 1,
            onChange: (bool isSelected, int num) {
              cubit.setAnswer(
                data.id,
                1,
                t.least_value,
              );
            },
            shape: BoxShape.circle,
            title: t.least_value,
          ),
        ),
      ],
    );
  }
}
