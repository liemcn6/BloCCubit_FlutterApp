import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class CustomButton extends BaseWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    this.height = 50,
    this.width = double.infinity,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.white,
    this.textSize = 16,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.margin = const EdgeInsets.all(10),
    required this.content,
    this.borderRadius = 5,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.showIconLeft = false,
    this.iconLeft = 'assets/images/dislike.svg',
    this.iconRight = 'assets/images/dislike.svg',
    this.widthIconLeft = 10,
    this.heightIconLeft = 10,
    this.widthIconRight = 10,
    this.showIconRight = false,
    this.heightIconRight = 10,
    this.isDisable = false,
    this.visible = true,
    this.disabledColor,
    this.disabledTextColor,
    this.disabledBorderColor,
  });

  final GestureTapCallback onTap;
  final String iconRight;
  final String iconLeft;
  final double widthIconLeft;
  final double heightIconLeft;
  final double widthIconRight;
  final double heightIconRight;
  final bool showIconLeft;
  final bool showIconRight;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final double width;
  final Color? color;
  final Color textColor;
  final FontWeight fontWeight;
  final String content;
  final double textSize;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isDisable;
  final bool visible;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? disabledBorderColor;

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appColors = appController.state.theme.colors;

    return Visibility(
      visible: visible,
      child: Container(
        width: width,
        margin: margin,
        child: Material(
          borderRadius: BorderRadius.circular(borderRadius),
          color: isDisable == false
              ? (color ?? appColors.primary)
              : disabledColor ?? (color != null ? color?.withOpacity(0.7) : appColors.disabled),
          child: InkWell(
            onTap: isDisable ? null : onTap,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: isDisable ? disabledBorderColor ?? appColors.disabledBorder : borderColor,
                  width: borderWidth,
                ),
              ),
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: showIconLeft,
                    child: SvgPicture.asset(
                      iconLeft,
                      width: widthIconLeft,
                      height: heightIconLeft,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Text(
                        content,
                        style: TextStyle(
                          color: isDisable ? disabledTextColor ?? appColors.disabledBg : textColor,
                          fontSize: textSize,
                          fontWeight: fontWeight,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Visibility(
                    visible: showIconRight,
                    child: SvgPicture.asset(
                      iconRight,
                      width: widthIconRight,
                      height: heightIconRight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
