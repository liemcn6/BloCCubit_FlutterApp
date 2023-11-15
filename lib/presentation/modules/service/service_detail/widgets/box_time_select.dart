import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_care/core/core.dart';

class BoxTimeSelect extends StatelessWidget {
  final AppTheme theme;
  final String? title;
  final String? content;
  final bool isSelected;
  final bool disable;
  final VoidCallback? onTapItem;

  const BoxTimeSelect({
    super.key,
    required this.theme,
    this.title,
    this.content,
    this.isSelected = false,
    this.onTapItem,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = isSelected;

    if (disable) {
      selected = false;
    }
    return InkWell(
      onTap: () {
        onTapItem?.call();
      },
      child: Container(
        constraints: const BoxConstraints(
          minWidth: Dimension.h62,
          minHeight: Dimension.h56,
          maxHeight: Dimension.h62,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.radius8),
          border: Border.all(
            color: selected ? theme.colors.primary : theme.colors.neutral3,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimension.padding8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "",
                    style: AppTextStyle.s12w400
                        .copyWith(color: disable ? theme.colors.neutral6 : theme.colors.neutral13),
                  ),
                  const Gap(Dimension.h4),
                  Text(
                    content ?? "",
                    style: AppTextStyle.s14w600.copyWith(
                      color: disable ? theme.colors.neutral6 : theme.colors.neutral13,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 2,
              right: 2,
              child: Visibility(
                visible: isSelected,
                child: SizedBox(
                  height: Dimension.h14,
                  width: Dimension.h14,
                  child: Icon(
                    Icons.check_circle,
                    color: theme.colors.primary,
                    size: Dimension.h14,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
