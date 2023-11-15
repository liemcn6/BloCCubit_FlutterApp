part of '../core.dart';

class WidgetUtils {
  static void showSnackBar({
    EdgeInsetsGeometry? margin,
    required BuildContext context,
    required AppTheme theme,
    required String title,
    Duration? duration,
    Widget? icon,
    DismissDirection? dismissDirection,
  }) async {
    final snackBar = snackBarWidget(
        backgroundColor: theme.colors.neutral13,
        context: context,
        title: title,
        margin: margin ?? EdgeInsets.only(bottom: DeviceUtils.getHeight3(context) - 56 - 58),
        color: theme.colors.primary,
        theme: theme,
        dismissDirection: dismissDirection,
        duration: duration);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Show error dialog
  static showError(
      {required BuildContext context,
      required String errorText,
      bool showIconClose = true,
      bool? closePreviousDialog = false,
      Function()? onTap,
      Function()? onTapClose,
      bool isDismiss = false,
      bool logout = false,
      final String? textBtnAccept,
      final String? errorTitle}) async {
    await showDialog(
      context: context,
      barrierDismissible: isDismiss,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            // if (onTapClose != null) {
            //   onTapClose();
            // }
            return isDismiss;
          },
          child: ErrorDialog(
            errorTitle: errorTitle,
            errorText: errorText,
            showIconClose: showIconClose,
            onTap: onTap,
            logout: logout,
            onTapClose: onTapClose,
            textBtnAccept: textBtnAccept,
          ),
        );
      },
    );
  }

  static showPopUpSuccess({
    required BuildContext context,
    required dynamic content,
    String? title,
    String? titleButtonYes,
    String? titleButtonNo,
    VoidCallback? onTapYes,
    VoidCallback? onTapNo,
    bool showButtonYes = true,
    bool showButtonNo = true,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final appController = context.watch<AppCubit>();
        final theme = appController.state.theme;
        final lang = Utils.languageOf(context);

        Widget content0 = const SizedBox.shrink();
        if (content is String) {
          content0 = Container(
            width: MediaQuery.of(context).size.width - 56 * 2,
            constraints: const BoxConstraints(
              minHeight: 56,
            ),
            child: Text(
              content,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
              textAlign: TextAlign.center,
              maxLines: 9,
            ),
          );
        }
        if (content is Widget) {
          content0 = content;
        }

        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width - 40 * 2,
              padding: const EdgeInsets.all(Dimension.padding16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(Dimension.radius8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Icon
                  Container(height: 72, alignment: Alignment.bottomCenter, child: AppSvgs.icCheck),

                  const SizedBox(height: 16),

                  /// Title
                  Visibility(
                    visible: title != null,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 56 * 2,
                      child: Text(
                        title ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.s20w600.copyWith(color: theme.colors.neutral13),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  ),

                  /// Content
                  content0,
                  const SizedBox(height: 16),

                  /// Button
                  SizedBox(
                    //height: 106,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomButton(
                            visible: showButtonYes,
                            height: 44,
                            borderRadius: Dimension.radius8,
                            margin: EdgeInsets.zero,
                            onTap: () {
                              onTapYes?.call();
                            },
                            fontWeight: FontWeight.w600,
                            content: titleButtonYes ?? lang.accept),
                        const SizedBox(height: 8),
                        CustomButton(
                            visible: showButtonNo,
                            height: 44,
                            borderRadius: Dimension.radius8,
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            textColor: theme.colors.neutral10,
                            borderColor: theme.colors.neutral3,
                            onTap: () {
                              if (onTapNo != null) {
                                onTapNo.call();
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            fontWeight: FontWeight.w600,
                            content: titleButtonNo ?? lang.close),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
