import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';

class IconHome extends StatelessWidget {
  final VoidCallback? onTapIcon;
  const IconHome({super.key, this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: onTapIcon?.call,
        icon: AppSvgs.icHomeWhite,
      ),
    );
  }
}
