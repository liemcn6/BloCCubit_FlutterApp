import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/presentation/modules/home/models/news_model.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/image_network.dart';
import 'package:home_care/presentation/widgets/shimer_loading.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<NewsModel> newsletterList;
  final bool isLoading;

  const ImageSliderWidget({
    super.key,
    required this.newsletterList,
    this.isLoading = true,
  });

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  final pageController = PageController();
  int currentPagePosition = 0;

  Future<void> onPageChanged(int pagePosition) async {
    setState(() {
      currentPagePosition = pagePosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    final theme = controller.state.theme;
    if (widget.isLoading) {
      return ShimmerLoading(
        context: context,
        isLoading: widget.isLoading,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 140,
        child: Stack(
          children: [
            //page view
            PageView.builder(
                controller: pageController,
                itemCount: widget.newsletterList.length > 5 ? 5 : widget.newsletterList.length,
                pageSnapping: true,
                onPageChanged: (int pagePosition) {
                  onPageChanged(pagePosition);
                },
                itemBuilder: (context, pagePosition) {
                  //image
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          AppNavigator.push(
                              Routes.newsDetails, widget.newsletterList[pagePosition].id);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            child: ImgNetWork(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              url: widget.newsletterList[pagePosition].avatarFileUrl ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
            //scroll
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                padding: const EdgeInsets.only(bottom: 8),
                child: Center(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          widget.newsletterList.length > 5 ? 5 : widget.newsletterList.length,
                      shrinkWrap: true,
                      // itemExtent: 20,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              height: 2,
                              width: 16,
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                  color: (currentPagePosition == index)
                                      ? theme.colors.primary
                                      : theme.colors.gray300.withOpacity(0.6),
                                  borderRadius: const BorderRadius.all(Radius.circular(4))),
                            ),
                            Visibility(
                              visible: index < widget.newsletterList.length - 1,
                              child: const SizedBox(
                                width: 2.0,
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
