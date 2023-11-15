import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

import 'card_view.dart';

class SelectWidget extends BaseWidget {
  final String title;
  final String? hintTitle;
  final String? value;
  final String? errorText;
  final bool isShowError;
  final bool isDisable;
  final VoidCallback? onTap;
  final double marginBottom;
  final double marginTop;
  final double marginRight;
  final double marginLeft;
  final Widget? icon;
  final bool isRequired;
  final bool isCalendar;

  const SelectWidget({
    super.key,
    required this.title,
    this.hintTitle,
    this.value,
    this.errorText,
    this.isShowError = false,
    this.isDisable = false,
    this.onTap,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginLeft = 0,
    this.icon,
    this.isRequired = false,
    this.isCalendar = false,
  });

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;

    return Column(
      children: [
        CardView(
          color: !isDisable ? Colors.white : theme.colors.colorNeutral3,
          onTap: isDisable ? null : onTap,
          padding: const EdgeInsets.all(Dimension.padding12),
          margin: EdgeInsets.only(
            left: marginLeft,
            right: marginRight,
            top: marginTop,
            bottom: isShowError ? 0 : marginBottom,
          ),
          border: Border.all(color: theme.colors.colorNeutral3, width: 1),
          radius: Dimension.radius8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Utils.isNullOrEmpty(value) ? Dimension.padding10 : 0,
                      ),
                      child: Utils.isNullOrEmpty(value)
                          ? Text.rich(
                              TextSpan(
                                text: hintTitle ?? title,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: theme.colors.neutral10,
                                ),
                                children: <TextSpan>[
                                  isRequired
                                      ? TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: theme.colors.red,
                                          ),
                                        )
                                      : const TextSpan(),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          : Text.rich(
                              TextSpan(
                                text: title,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.colors.neutral13,
                                ),
                                children: <TextSpan>[
                                  isRequired
                                      ? TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: theme.colors.red,
                                          ),
                                        )
                                      : const TextSpan(),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                    ),
                    Visibility(
                      visible: !Utils.isNullOrEmpty(value),
                      child: Text(
                        value ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: Dimension.padding8),
                child: icon ?? (isCalendar ? AppSvgs.icCalendar : AppSvgs.icChevronDropdown),
              ),
            ],
          ),
        ),
        Visibility(
          visible: isShowError,
          child: Container(
            padding: const EdgeInsets.only(
              top: Dimension.padding4,
              right: Dimension.padding4,
              left: Dimension.padding4,
            ),
            margin: EdgeInsets.only(
              left: Dimension.margin16,
              right: Dimension.margin16,
              bottom: marginBottom,
            ),
            child: Text(
              errorText ?? '',
              style: TextStyle(fontSize: 14, color: theme.colors.error),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
