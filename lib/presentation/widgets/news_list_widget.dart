import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/home/models/news_model.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/image_network.dart';

class NewsListWidget extends StatefulWidget {
  final List<NewsModel> newsletterList;

  const NewsListWidget({
    super.key,
    required this.newsletterList,
  });

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    final theme = controller.state.theme;
    return Flexible(
      child: ListView.builder(
        // padding: const EdgeInsets.all(8),
        itemCount: widget.newsletterList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              AppNavigator.push(Routes.newsDetails, widget.newsletterList[index].id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: theme.colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Row(
                    children: [
                      ImgNetWork(
                        width: 90,
                        height: 60,
                        url: widget.newsletterList[index].avatarFileUrl,
                        fit: BoxFit.cover,
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.newsletterList[index].title ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: AppTextStyle.s14w400cBlack
                                    .copyWith(color: theme.colors.textTitle)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
