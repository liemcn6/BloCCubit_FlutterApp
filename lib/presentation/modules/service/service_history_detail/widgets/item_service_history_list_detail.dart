import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/service/service_history_detail.dart';

class ItemServiceHistoryListDetail extends StatelessWidget {
  final AppTheme theme;
  final AppLocalizations t;
  final int index;
  final ServiceHistoryDetail? history;

  const ItemServiceHistoryListDetail({
    super.key,
    required this.theme,
    required this.t,
    required this.index,
    this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: Dimension.padding16,
      ),
      constraints: const BoxConstraints(minHeight: 76),
      decoration: BoxDecoration(
        color: theme.colors.white,
        borderRadius: BorderRadius.circular(Dimension.radius8),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: Dimension.padding16, vertical: Dimension.padding12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${index + 1}. ",
                    style: AppTextStyle.s14w500.copyWith(
                      color: theme.colors.primary,
                    )),
                Text(
                  history?.title ?? "--",
                  style: AppTextStyle.s14w500.copyWith(
                    color: theme.colors.neutral13,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateTimeUtils.formatDateTime(
                          history?.createdAt, DateTimeUtils.HH_mm_ss_dd_MM_yyyy) ??
                      "",
                  style: AppTextStyle.s14w500.copyWith(
                    color: theme.colors.colorNewTextSubTitle,
                  ),
                ),
                const Gap(Dimension.h8),
                Text(
                  history?.reason ?? "--",
                  style: AppTextStyle.s14w400.copyWith(
                    color: theme.colors.colorNewTextSubTitle,
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
