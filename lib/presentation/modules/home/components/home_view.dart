part of '../home_screen.dart';

class HomeView extends BaseWidget {
  const HomeView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getInit(context: context);
      context.read<AppCubit>().requestCountUnread();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final homeCubit = context.watch<HomeCubit>();
    final additionalSize = Platform.isIOS ? 0 : 16;

    Widget headerBody() {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: 145,
        child: Stack(
          children: [
            Image(
              image: AppImages.bgHomeSecond,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 12 + additionalSize,
                left: 16,
              ),
              child: Row(
                children: [
                  ImgNetWork(
                    url: homeCubit.state.userProfile.avatarFileUrl,
                    blankImage: AppImages.blankAvatar.assetName,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    width: 40,
                    height: 40,
                    border: Border.all(
                      width: 2,
                      color: theme.colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: Dimension.padding8),
                    // padding: EdgeInsets.zero,

                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: homeCubit.state.userProfile.fullName ?? '- -',
                          style: AppTextStyle.s16w400cWhite,
                          // overflow: TextOverflow.ellipsis,
                          children: [
                            TextSpan(
                                text:
                                    "\n${t.account_type(homeCubit.state.userProfile.accountType ?? '')}",
                                style: AppTextStyle.s12.copyWith(color: theme.colors.white)
                                // overflow: TextOverflow.ellipsis,
                                ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              child: GestureDetector(
                  onTap: () {
                    AppNavigator.push(Routes.notificationMain);
                  },
                  child: Stack(
                    // alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 12 + additionalSize),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colors.white,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: MediaQuery.of(context).padding.top + 20 + additionalSize),
                            child: AppSvgs.icNotification,
                          ),
                          appController.state.countUnread != 0
                              ? Positioned(
                                  top: MediaQuery.of(context).padding.top,
                                  right: (appController.state.countUnread ?? 0) > 100 ? 0 : 4,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(top: 24),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                              Utils.getCountNotify(
                                                  appController.state.countUnread ?? 0),
                                              style: AppTextStyle.s10w400cBlack.copyWith(
                                                  color: theme.colors.white,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colors.primary,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              // alignment: Alignment.center,
              children: [
                //header
                headerBody(),
                // body
                Positioned.fill(
                  top: 145,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimension.padding16),
                        topRight: Radius.circular(Dimension.padding16),
                      ),
                      color: Colors.white,
                    ),
                    child: LimitedAccessWidget(
                      isAccessLimited: homeCubit.state.isAccessLimited,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          homeCubit.handlerRefresh(context: context);
                        },
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: Dimension.padding16,
                              right: Dimension.padding16,
                              bottom: Dimension.padding16,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //body items
                                Flexible(
                                  child: GridView.count(
                                    padding: const EdgeInsets.only(top: 25),
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 0,
                                    // mainAxisSpacing: 8,
                                    // childAspectRatio: 19 / 20,
                                    children: List.generate(
                                        homeCubit.state.listScreen.length < 6
                                            ? homeCubit.state.listScreen.length
                                            : 6, (index) {
                                      if (homeCubit.state.listScreen.isNotEmpty &&
                                          index < homeCubit.state.listScreen.length) {
                                        HomeModel value = homeCubit.state.listScreen[index];
                                        return (index < 5)
                                            ? HomeButtonWidget(
                                                value: value,
                                              )
                                            : HomeButtonWidget(
                                                value: HomeModel(
                                                  screenIc: Image.asset(AppImages.icMore.assetName,
                                                      width: 48),
                                                  title: t.all_features,
                                                  onPress: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        backgroundColor: Colors.transparent,
                                                        builder: (context) {
                                                          return const HomeBottomSheet();
                                                        });
                                                  },
                                                  type: HomeType.problem,
                                                ),
                                              );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    }),
                                  ),
                                ),

                                //image slide
                                Visibility(
                                  visible: homeCubit.state.isNewsViewed,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, Dimension.padding16, 0, Dimension.padding32),
                                        child: Shimmer(
                                          linearGradient: Utils.shimmerGradient,
                                          child: ImageSliderWidget(
                                            isLoading: homeCubit.state.isMostViewLoading,
                                            newsletterList:
                                                homeCubit.state.mostViewedNewsletterModelList,
                                          ),
                                        ),
                                      ),
                                      //news list
                                      Center(
                                        child: Shimmer(
                                          linearGradient: Utils.shimmerGradient,
                                          child: NewsListHomeScreenWidget(
                                            isLoading: homeCubit.state.isNewsLoading,
                                            newsletterList:
                                                homeCubit.state.communityNewsletterModelList,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
