import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class CardView extends BaseWidget {
  final Widget? child; // Child widget for custom inside
  final double? radius; // border radius of button
  final Color? color; // Background color
  final String title; // Title of button
  final TextStyle? titleStyle; // Title style
  final VoidCallback? onTap; // On tap
  final EdgeInsets padding; // Padding
  final EdgeInsets? margin; // Margin
  final bool disable; // Disable button
  final AlignmentGeometry alignment;
  final bool setMinWidth;
  final BoxBorder? border;
  final double? elevation;
  final double? height;
  final double? width;

  const CardView({
    super.key,
    this.child,
    this.radius = 4,
    this.color,
    this.titleStyle,
    this.disable = false,
    this.onTap,
    this.title = "",
    this.padding = const EdgeInsets.symmetric(
      vertical: Dimension.padding12,
      horizontal: Dimension.padding16,
    ),
    this.margin = const EdgeInsets.symmetric(
      horizontal: Dimension.margin16,
      vertical: Dimension.margin8,
    ),
    this.alignment = Alignment.center,
    this.setMinWidth = false,
    this.border,
    this.elevation,
    this.height,
    this.width,
  });
  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final colors = appController.state.theme.colors;
    final colorBG = color ?? colors.primary;
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: radius == 0 ? null : BorderRadius.circular(radius!),
          border: border ?? Border.all(width: 0, color: Colors.transparent)),
      child: Material(
        elevation: elevation ?? 0,
        color: disable ? colors.disabled : colorBG,
        borderRadius: BorderRadius.circular(radius!),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius!),
          onTap: disable ? null : onTap,
          child: (setMinWidth)
              ? child ?? Text(title.toString(), style: titleStyle ?? AppTextStyle.s16w400cWhite)
              : Container(
                  //color: Colors.white,
                  padding: padding,
                  alignment: alignment,
                  width: width,
                  child: child ??
                      Text(
                        title.toString(),
                        style: titleStyle ?? AppTextStyle.s16w400cWhite,
                      ),
                ),
        ),
      ),
    );
  }
}
