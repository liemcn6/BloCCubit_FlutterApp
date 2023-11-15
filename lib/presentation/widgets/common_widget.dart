import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../routes.dart';

class CommonWidget {
  static iconBack323E44() {
    return IconButton(
      color: Colors.transparent,
      onPressed: () {
        AppNavigator.pop();
      },
      icon: AppSvgs.icBack323E44,
    );
  }

  static iconBackWhite() {
    return IconButton(
      color: Colors.transparent,
      onPressed: () {
        AppNavigator.pop();
      },
      icon: AppSvgs.icBackWhite,
    );
  }

  static badge(String text, Color textColor, Color bgColor) {
    return Container(
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        text,
        style: AppTextStyle.s12w400.copyWith(
          color: textColor,
        ),
      ),
    );
  }

  static BadgeColor badgeYellow(AppTheme theme) {
    return BadgeColor(theme.colors.yellow8, theme.colors.yellow1);
  }

  static BadgeColor badgeBlue(AppTheme theme) {
    return BadgeColor(theme.colors.blue8, theme.colors.blue1);
  }

  static BadgeColor badgeGreen(AppTheme theme) {
    return BadgeColor(theme.colors.green8, theme.colors.green1);
  }

  static BadgeColor badgePurple(AppTheme theme) {
    return BadgeColor(theme.colors.purple8, theme.colors.purple1);
  }

  static BadgeColor badgeDefault(AppTheme theme) {
    return BadgeColor(theme.colors.neutral13, theme.colors.neutral2);
  }

  static BadgeColor badgeUnknown() {
    return BadgeColor(Colors.transparent, Colors.transparent);
  }
}

class BadgeColor {
  final Color textColor;
  final Color bgColor;

  BadgeColor(this.textColor, this.bgColor);
}
