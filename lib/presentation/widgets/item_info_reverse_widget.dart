import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class ItemInfoViewReverse extends BaseWidget {
  final String label;
  final String value;
  final bool visible;
  const ItemInfoViewReverse({
    super.key,
    required this.label,
    required this.value,
    this.visible = true,
  });

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(
              children: [
                Text(
                  label,
                  style: AppTextStyle.s16w400cBlack.copyWith(
                    color: theme.colors.neutralDark13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Dimension.margin4,
            ),
            Text(
              value,
              style: AppTextStyle.s12
                  .copyWith(color: theme.colors.colorNewTextSubTitle, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
