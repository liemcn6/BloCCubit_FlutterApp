import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/routes.dart';

import 'base_widget.dart';

class Header extends BaseWidget {
  const Header({
    super.key,
    this.title = "",
    // this.color = "#141ED2",
    this.actions,
    this.onPressed,
    this.visibleBack = true,
    this.setStatusBarIconDark = false,
    this.backgroundColor,
    this.elevation,
    this.isHideBackgroundImg = false,
    this.onTapButtonBack,
    this.leadingWidget,
    this.textStyle,
  });

  final String title;
  final bool visibleBack;

  // final router = useRouter();

  // String? color;
  final List<Widget>? actions;
  final VoidCallback? onPressed;
  final bool setStatusBarIconDark;
  final Color? backgroundColor;
  final double? elevation;
  final bool isHideBackgroundImg;
  final VoidCallback? onTapButtonBack;
  final Widget? leadingWidget;
  final TextStyle? textStyle;

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    return AppBar(
      elevation: elevation,
      leadingWidth: (leadingWidget != null) ? MediaQuery.of(context).size.width / 2 : null,
      leading: leadingWidget ??
          (!visibleBack
              ? Container()
              // : IconButton(
              //     icon: const Icon(
              //       Icons.arrow_back_ios,
              //       color: Colors.white,
              //     ),
              //     onPressed: onPressed ??
              //         () {
              //           AutoRouter.of(context).pop();
              //         },
              //     // padding: const EdgeInsets.all(20),
              //     tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              //   ),
              : IconButton(
                  color: Colors.transparent,
                  onPressed: onPressed ??
                      () {
                        onTapButtonBack?.call();
                        AppNavigator.pop();
                      },
                  icon: AppSvgs.icBackWhite,
                )),
      centerTitle: true,
      title: Text(
        title,
        softWrap: true,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: textStyle ?? AppTextStyle.s16w600cWhite.copyWith(fontWeight: FontWeight.w500),
      ),
      actions: actions,
      backgroundColor: backgroundColor ?? theme.colors.primary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: setStatusBarIconDark ? Brightness.dark : Brightness.light,
        statusBarBrightness: setStatusBarIconDark ? Brightness.dark : Brightness.light,
      ),
      flexibleSpace: SafeArea(
        bottom: false,
        child: isHideBackgroundImg
            ? const Offstage()
            : Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Color.fromRGBO(20, 30, 210, 1),
                  //     Color.fromRGBO(8, 49, 156, 1)
                  //   ],
                  //   begin: FractionalOffset(0.0, 0.0),
                  //   end: FractionalOffset(0.0, 1.0),
                  //   stops: [0.0, 1.0],
                  // ),
                  color: theme.colors.primary,
                ),
                child: const Align(
                  // alignment: Alignment(-0.3, 0),
                  child: Image(
                    image: AppImages.bgHeaderBuild,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
      ),
    );
  }
}
