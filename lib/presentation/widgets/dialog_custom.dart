import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';

class DialogCustom extends BaseWidget {
  const DialogCustom({
    super.key,
    required this.onPressBtnAccept,
    required this.onPressBtnCancel,
    this.title = '',
    this.colorTitle = const Color(0xff39A07C),
    this.colorButtonAccept = const Color(0xff39A07C),
    this.content = '',
    this.showBtnAccept = true,
    this.showBtnCancel = false,
    this.textBtnAccept = '',
    this.textBtnCancel = '',
    this.contentAlignment = Alignment.centerLeft,
    this.showIconClose = true,
    this.onTapClose,
    this.showErrorIcon = false,
  });

  final String title;
  final Color colorTitle;
  final Color colorButtonAccept;
  final String content;
  final bool showBtnAccept;
  final bool showBtnCancel;
  final bool showIconClose;
  final String textBtnAccept;
  final String textBtnCancel;
  final GestureTapCallback onPressBtnAccept;
  final GestureTapCallback onPressBtnCancel;
  final Alignment contentAlignment;
  final Function()? onTapClose;
  final bool showErrorIcon;

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appColors = appController.state.theme.colors;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(Dimension.padding12),
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              color: appColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  // alignment: contentAlignment,
                  child: Center(
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: appColors.colorFF00000,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: showBtnAccept,
                  child: CardView(
                    color: colorButtonAccept,
                    radius: 8,
                    onTap: onPressBtnAccept,
                    title: textBtnAccept,
                    titleStyle: TextStyle(
                      color: appColors.white,
                      fontSize: 16,
                    ),
                    margin: const EdgeInsets.only(
                      top: Dimension.margin24,
                      left: Dimension.margin16,
                      right: Dimension.margin16,
                    ),
                  ),
                ),
                Visibility(
                  visible: showBtnCancel,
                  child: CardView(
                    onTap: onPressBtnCancel,
                    title: textBtnCancel,
                    radius: 8,
                    margin: const EdgeInsets.only(
                      top: Dimension.margin8,
                      left: Dimension.margin16,
                      right: Dimension.margin16,
                    ),
                    titleStyle: TextStyle(
                      color: appColors.btnSecondary,
                      fontSize: 16,
                    ),
                    color: Colors.white,
                    border: Border.all(color: appColors.btnBorderSecondary),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
