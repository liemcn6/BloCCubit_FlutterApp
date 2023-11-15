import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final AppTheme theme;
  final bool showButton;
  final VoidCallback? onTap;
  const FloatingActionButtonWidget({super.key,required this.theme, this.showButton = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showButton,
      child: FloatingActionButton(
        backgroundColor: theme.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          onTap?.call();
        },
        child: Icon(
          Icons.add,
          color: theme.colors.white,
        ),
      ),
    );
  }
}
