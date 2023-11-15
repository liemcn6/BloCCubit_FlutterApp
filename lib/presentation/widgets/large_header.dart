import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/common_widget.dart';

class LargeHeader extends BaseWidget {
  final ImageProvider<Object> image;
  final Function? onPressed;
  final String title;

  const LargeHeader({
    required this.image,
    required this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    return Stack(
      children: [
        Image(
          image: image,
          fit: BoxFit.fitWidth,
        ),
        SafeArea(
          child: CommonWidget.iconBack323E44(),
        ),
        Positioned.fill(
          bottom: 24,
          left: 16,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: AppTextStyle.s24w400cBlack.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colors.neutral13,
              ),
            ),
          ),
        )
      ],
    );
    // return AppBar(
    //   leading: IconButton(
    //     icon: const Icon(
    //       Icons.arrow_back_ios,
    //       color: Colors.black,
    //     ),
    //     onPressed: () {
    //       if (onPressed != null) {
    //         onPressed!();
    //       } else {
    //         AppNavigator.pop();
    //       }
    //     },
    //   ),
    //   flexibleSpace: Container(
    //     height: const Size.fromHeight(180).height,
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: image,
    //         fit: BoxFit.fitHeight,
    //       ),
    //     ),
    //     child: Stack(
    //       children: [
    //         Image(
    //           image: image,
    //           fit: BoxFit.fitWidth,
    //         ),
    //         Positioned(
    //           left: 16,
    //           bottom: 24,
    //           child: Text(
    //             title,
    //             style: TextStyle(
    //               fontSize: 24,
    //               fontWeight: FontWeight.w600,
    //               color: theme.colors.neutralDark13,
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
