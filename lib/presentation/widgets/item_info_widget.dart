import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class ItemInfoView extends BaseWidget {
  final String label;
  final String value;
  final bool visible;
  final bool isDividerVisible;
  final Widget widgetChild;
  const ItemInfoView(
      {super.key,
      required this.label,
      this.value = "",
      this.visible = true,
      this.isDividerVisible = true,
      this.widgetChild = const SizedBox()});

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    return Visibility(
      visible: visible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: AppTextStyle.s12.copyWith(
                      color: theme.colors.colorNewTextSubTitle, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: Dimension.margin4,
                ),
                (value == "" && widgetChild != const SizedBox())
                    ? widgetChild
                    : Wrap(
                        children: [
                          Text(
                            value,
                            style: AppTextStyle.s16w400cBlack.copyWith(
                              color: theme.colors.neutralDark13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          Visibility(
            visible: isDividerVisible,
            child: Divider(
              color: theme.colors.enableTextColor,
              height: Dimension.divideHeight,
            ),
          ),
        ],
      ),
    );
  }
}
