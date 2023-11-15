import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/custom_dialog.dart';

Future showErrorDialog({
  required String title,
  String? headerTitle,
  bool showCloseButton = true,
  Function()? onClose,
  Function()? onRetry,
  String? retryText,
  bool shouldDismiss = true,
  Widget? errorImage,
}) async {
  final context = AppNavigator.navigatorKey.currentContext;

  if (context == null) {
    return;
  }

  await showDialog(
      context: context,
      builder: (_) => WillPopScope(
            onWillPop: () async {
              // if (onTapClose != null) {
              //   onTapClose();
              // }
              return shouldDismiss;
            },
            child: ErrorDialog(
              errorText: title,
              errorTitle: headerTitle,
              showIconClose: showCloseButton,
              onTap: onRetry,
              onTapClose: onClose,
              textBtnAccept: retryText,
              errorImage: errorImage ?? const SizedBox.shrink(),
            ),
          ));
}

class ErrorDialog extends BaseWidget {
  final String errorText;
  final bool showIconClose;
  final Function()? onTap;
  final bool logout;
  final Function()? onTapClose;
  final String? textBtnAccept;
  final String? errorTitle;
  final Widget errorImage;

  const ErrorDialog({
    super.key,
    required this.errorText,
    this.showIconClose = true,
    this.onTap,
    this.onTapClose,
    this.logout = false,
    this.textBtnAccept,
    this.errorTitle,
    this.errorImage = const SizedBox.shrink(),
  });

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final colors = appController.state.theme.colors;
    return CustomDialog(
      colorTitle: colors.error,
      title: errorTitle ?? t.error_noti,
      content: errorText,
      textBtnAccept: textBtnAccept ?? t.close,
      errorImage: errorImage,
      onPressBtnCancel: () {},
      onPressBtnAccept: () async {
        if (logout) {
          AppNavigator.pushRoot(Routes.login);
        } else {
          onTap?.call();
          AppNavigator.pop();
        }
      },
      onTapClose: onTapClose,
    );
  }
}
