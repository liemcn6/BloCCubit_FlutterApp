import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';

class ItemView extends StatelessWidget {
  final String title; // Child widget for custom inside
  final dynamic icon; // border radius of button
  final GestureTapCallback? onTap; // Background color
  final bool visible; // Background color
  final Widget? rightIcon;
  final bool dividerVisible;

  const ItemView({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.visible = true,
    this.rightIcon,
    this.dividerVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    final appState = controller.state;
    final theme = appState.theme;
    return Visibility(
      visible: visible,
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            // borderRadius: BorderRadius.circular(Dimension.padding12),
            child: InkWell(
              onTap: onTap,
              // borderRadius: BorderRadius.circular(Dimension.padding12),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Row(
                      children: [
                        icon,
                        const SizedBox(
                          width: Dimension.margin12,
                        ),
                        Text(
                          title,
                          style: AppTextStyle.s16w400cBlack.copyWith(
                            color: theme.colors.textTitle,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    rightIcon ?? const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: dividerVisible,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: theme.colors.enableTextColor,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
