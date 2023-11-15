import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class ButtonView extends BaseWidget {
  final Widget? child; // Child widget for custom inside
  final double? radius; // border radius of button
  final Color? color; // Background color
  final String title; // Title of button
  final TextStyle? titleStyle; // Title style
  final void Function(dynamic)? onPress;
  final void Function(dynamic)? onLongPress;
  final void Function(dynamic)? onDoublePress;
  // final VoidCallback? () => onPress; // On tap
  // final VoidCallback? onLongPress; // On tap
  final EdgeInsets padding; // Padding
  final EdgeInsets? margin; // Margin
  final bool disable; // Disable button
  final AlignmentGeometry alignment;
  final bool setMinWidth;
  final BoxBorder? border;
  final double? elevation;
  final double? height;
  final dynamic data;

  const ButtonView({
    super.key,
    this.child,
    this.radius = 8,
    this.color,
    this.titleStyle,
    this.disable = false,
    this.onPress,
    this.onLongPress,
    this.onDoublePress,
    this.title = "",
    this.padding = const EdgeInsets.symmetric(
      vertical: Dimension.padding12,
      horizontal: Dimension.padding16,
    ),
    this.margin = const EdgeInsets.symmetric(
      horizontal: Dimension.margin16,
      // vertical: FontSize.pt8,
    ),
    this.alignment = Alignment.center,
    this.setMinWidth = false,
    this.border,
    this.elevation,
    this.height,
    this.data,
  });

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final colors = appController.state.theme.colors;
    final colorBG = color ?? colors.primary;
    void handleOnPress() {
      if (onPress != null) {
        onPress!({key: data});
      }
    }

    void handleOnLogPress() {
      if (onLongPress != null) {
        onLongPress!({key: data});
      }
    }

    void handleOnDoublePress() {
      if (onDoublePress != null) {
        onDoublePress!({key: data});
      }
    }

    return Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
          borderRadius: radius == 0 ? null : BorderRadius.circular(radius!),
          border: border ?? Border.all(width: 0, color: Colors.transparent)),
      child: Material(
        elevation: elevation ?? 0,
        color: disable ? colors.neutral6 : colorBG,
        borderRadius: BorderRadius.circular(radius!),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius!),
          onDoubleTap: disable ? null : handleOnDoublePress,
          onLongPress: disable ? null : handleOnLogPress,
          onTap: disable ? null : handleOnPress,
          child: (setMinWidth)
              ? child ??
                  Text(
                    title.toString(),
                    style: titleStyle ??
                        AppTextStyle.s16w400cWhite.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  )
              : Container(
                  padding: padding,
                  alignment: alignment,
                  child: child ??
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title.toString(),
                            style: titleStyle ?? AppTextStyle.s16w400cWhite,
                          )
                        ],
                      ),
                ),
        ),
      ),
    );
  }
}
