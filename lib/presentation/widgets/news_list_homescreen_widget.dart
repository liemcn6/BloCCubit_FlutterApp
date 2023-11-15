import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/home/models/news_model.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/image_network.dart';
import 'package:home_care/presentation/widgets/shimer_loading.dart';

class NewsListHomeScreenWidget extends StatefulWidget {
  final List<NewsModel> newsletterList;
  final bool isLoading;
  const NewsListHomeScreenWidget({
    super.key,
    required this.newsletterList,
    this.isLoading = true,
  });

  @override
  State<NewsListHomeScreenWidget> createState() => _NewsListHomeScreenWidgetState();
}

class _NewsListHomeScreenWidgetState extends State<NewsListHomeScreenWidget> {
  final pageController = PageController();
  int currentPagePosition = 0;
  int gridItemCount = 0;

  int itemCount() {
    if (widget.newsletterList.length % 4 == 0) {
      gridItemCount = widget.newsletterList.length ~/ 4;
    } else {
      gridItemCount = widget.newsletterList.length ~/ 4 + 1;
    }
    if (gridItemCount > 5) {
      gridItemCount = 5;
    }
    return gridItemCount;
  }

  Future<void> onPageChanged(int pagePosition) async {
    setState(() {
      currentPagePosition = pagePosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    final theme = controller.state.theme;
    final t = Utils.languageOf(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t.community_newsletter,
              style: AppTextStyle.s20w400cBlack.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colors.neutralDark13,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                AppNavigator.push(Routes.newsMain);
              },
              child: Text(
                t.show_more,
                style: AppTextStyle.s14.copyWith(
                  fontWeight: FontWeight.w400,
                  color: theme.colors.textTitle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        widget.newsletterList.isEmpty && widget.isLoading == false
            ? const SizedBox.shrink()
            : (widget.isLoading)
                ? ShimmerLoading(
                    context: context,
                    isLoading: widget.isLoading,
                    child: Container(
                      height: 371,
                      decoration: BoxDecoration(
                        color: theme.colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colors.newDropShadowColor.withOpacity(0.16),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 355,
                          child: PageView.builder(
                              controller: pageController,
                              itemCount: widget.isLoading ? 4 : itemCount(),
                              pageSnapping: true,
                              onPageChanged: (int pagePosition) {
                                onPageChanged(pagePosition);
                              },
                              itemBuilder: (context, pagePosition) {
                                return Column(
                                  children: [
                                    //4 item inside
                                    Flexible(
                                      child: GridView.count(
                                        padding: const EdgeInsets.all(8),
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                        children: List.generate(4, (index) {
                                          return 4 * pagePosition + index <
                                                  widget.newsletterList.length
                                              ? InkWell(
                                                  onTap: () {
                                                    AppNavigator.push(
                                                        Routes.newsDetails,
                                                        widget
                                                                .newsletterList[
                                                                    4 * pagePosition + index]
                                                                .id ??
                                                            "");
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      ImgNetWork(
                                                        width: MediaQuery.of(context).size.width /
                                                            5 *
                                                            3,
                                                        height: 100,
                                                        url: widget
                                                            .newsletterList[
                                                                4 * pagePosition + index]
                                                            .avatarFileUrl,
                                                        fit: BoxFit.cover,
                                                        borderRadius: const BorderRadius.all(
                                                          Radius.circular(8),
                                                        ),
                                                        blankImage: AppImages.noImage.assetName,
                                                      ),
                                                      const SizedBox(
                                                        height: Dimension.padding8,
                                                      ),
                                                      Text(
                                                        widget
                                                                .newsletterList[
                                                                    4 * pagePosition + index]
                                                                .title ??
                                                            "",
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: AppTextStyle.s14.copyWith(
                                                          fontWeight: FontWeight.w500,
                                                          color: theme.colors.neutralDark13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : const SizedBox.shrink();
                                        }),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 10,
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Center(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: itemCount(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Container(
                                        height: 2,
                                        width: 16,
                                        // padding: const EdgeInsets.symmetric(vertical: 8),
                                        decoration: BoxDecoration(
                                            color: (currentPagePosition == index)
                                                ? theme.colors.primary
                                                : theme.colors.disabledBg.withOpacity(0.6),
                                            borderRadius:
                                                const BorderRadius.all(Radius.circular(4))),
                                      ),
                                      Visibility(
                                        visible: index < itemCount() - 1,
                                        child: const SizedBox(
                                          width: 2.0,
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                  ),
      ],
    );
  }
}
