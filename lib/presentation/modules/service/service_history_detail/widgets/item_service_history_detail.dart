import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';

class ItemServiceHistoryDetail extends StatelessWidget {
  final AppTheme theme;
  final String? title;
  final dynamic content;
  final bool showBottomLine;

  const ItemServiceHistoryDetail({
    super.key,
    required this.theme,
    this.title,
    this.content,
    this.showBottomLine = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content0 = const SizedBox.shrink();
    if (content is String) {
      content0 = Expanded(
        child: Text(
          content,
          style: AppTextStyle.s16w400.copyWith(color: theme.colors.neutral13),
        ),
      );
    }
    if (content is Widget) {
      content0 = content;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimension.padding6),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? "",
            style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral10),
          ),
          const SizedBox(
            height: Dimension.padding8,
          ),
          Row(
            children: [
              content0,
            ],
          ),
          const SizedBox(
            height: Dimension.padding12,
          ),
          showBottomLine
              ? Divider(
                  color: theme.colors.border,
                  height: 1,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
