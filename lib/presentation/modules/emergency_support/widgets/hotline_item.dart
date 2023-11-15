import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/emergency_support/hotline.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HotlineItem extends BaseWidget {
  final Hotline item;
  final bool isLastItem;

  const HotlineItem({
    super.key,
    required this.item,
    this.isLastItem = false,
  });

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    return Container(
      decoration: BoxDecoration(
        border: !isLastItem
            ? Border(
                bottom: BorderSide(
                  color: theme.colors.gray400,
                  width: 1,
                ),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.title,
                style: AppTextStyle.s16w400cBlack,
                softWrap: true,
              ),
            ),
            CardView(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              color: Colors.transparent,
              onTap: () {
                launchUrlString("tel://${item.phoneNumber}");
              },
              child: Text(
                item.phoneNumber,
                style: AppTextStyle.s16w400cWhite
                    .copyWith(
                      color: theme.colors.primary,
                    )
                    .merge(
                      TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: theme.colors.primary,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
