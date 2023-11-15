import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';

class BottomSheetWidget extends BaseWidget {
  final String? title; // Title text
  final String? subTitle; // Title text
  final TextStyle? titleStyle; // Title style
  final bool showIconClose; // Show icon close
  final bool expandChild; // Show icon close
  final Widget? child; // Child
  final double? height;
  final bool iconCloseRight;
  final Function? onDismiss;
  final Color? colorHeader;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? paddingHeader;
  final Color? colorIcon;
  final Function? onClose;
  final int? maxLinesTitle;
  final Widget? leftWidget;

  const BottomSheetWidget({
    Key? key,
    this.title,
    this.subTitle,
    this.titleStyle,
    this.showIconClose = true,
    this.expandChild = false,
    this.child,
    this.height,
    this.iconCloseRight = false,
    this.onDismiss,
    this.colorHeader,
    this.backgroundColor,
    this.paddingHeader = EdgeInsets.zero,
    this.colorIcon = Colors.white,
    this.onClose,
    this.maxLinesTitle = 1,
    this.leftWidget,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appColors = appController.state.theme.colors;
    final colorHead = colorHeader ?? appColors.primary;
    return SafeArea(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (Utils.isNullOrEmpty(title))
                ? Container()
                : Container(
                    padding: paddingHeader,
                    decoration: BoxDecoration(
                      color: appColors.primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            leftWidget ?? Container(),
                            (!(iconCloseRight))
                                ? renderCloseButton(colorIcon, context)
                                : iconEmpty(colorHead),
                            iconCloseRight
                                ? renderCloseButton(colorIcon, context)
                                : iconEmpty(colorHead),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimension.padding16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                title ?? '',
                                style: titleStyle ??
                                    AppTextStyle.s16w400cWhite
                                        .copyWith(fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                                maxLines: maxLinesTitle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Utils.isNullOrEmpty(subTitle)
                                  ? Container()
                                  : const SizedBox(height: 4),
                              Utils.isNullOrEmpty(subTitle)
                                  ? Container()
                                  : Text(
                                      subTitle!,
                                      style: AppTextStyle.s16w400cWhite
                                          .copyWith(color: appColors.gray400),
                                      textAlign: TextAlign.center,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            if (expandChild) Expanded(child: child ?? Container()),
            if (!expandChild) child ?? Container()
          ],
        ),
      ),
    );
  }

  Widget renderCloseButton(Color? color, BuildContext context) {
    return showIconClose
        ? CardView(
            margin: EdgeInsets.zero,
            color: Colors.transparent,
            onTap: () {
              onTapClose(context);
            },
            child: AppSvgs.icCloseWithColor(color ?? Colors.white),
          )
        : Container();
  }

  Widget iconEmpty(Color color) {
    return showIconClose
        ? CardView(
            margin: EdgeInsets.zero,
            color: Colors.transparent,
            child: AppSvgs.icClose,
          )
        : Container();
  }

  /// On tap close
  onTapClose(BuildContext context) {
    if (onClose != null) {
      onClose!();
    }
    Navigator.of(context, rootNavigator: true).pop();

    if (onDismiss != null) {
      onDismiss!();
    }
  }
}
