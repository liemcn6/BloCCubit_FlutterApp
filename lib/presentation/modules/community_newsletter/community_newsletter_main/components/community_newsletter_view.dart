part of '../community_newsletter.dart';

class CommunityNewsletterView extends BaseWidget {
  const CommunityNewsletterView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CommunityNewsletterCubit>().init();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<CommunityNewsletterCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: theme.appColors.newBg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: LargeHeader(
          image: AppImages.newsHeader,
          title: t.news_header,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //image slide
              Visibility(
                visible: cubit.state.mostViewedNewsletterModelList.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Shimmer(
                    linearGradient: Utils.shimmerGradient,
                    child: ImageSliderWidget(
                      isLoading: cubit.state.isLoading,
                      newsletterList: cubit.state.mostViewedNewsletterModelList,
                    ),
                  ),
                ),
              ),

              //change category
              Padding(
                padding: EdgeInsets.only(
                  top: 6,
                  bottom: 20,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 36,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.state.categoryList.length,
                      // itemCount: 2,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        //category button
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: (cubit.state.categoryList[index] ==
                                                cubit.state.selectedCategory)
                                            ? theme.colors.primary
                                            : theme.colors.white,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        cubit.changeCategory(cubit.state.categoryList[index]);
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        // padding: const EdgeInsets.all(16.0),
                                      ),
                                      child: Text(
                                        cubit.state.categoryList[index],
                                        style: AppTextStyle.s14.copyWith(
                                          color: cubit.state.categoryList[index] ==
                                                  cubit.state.selectedCategory
                                              ? theme.colors.white
                                              : theme.colors.gray700,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        );
                      }),
                ),
              ),
              //news list
              NewsListWidget(
                newsletterList: cubit.state.communityNewsletterModelList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
