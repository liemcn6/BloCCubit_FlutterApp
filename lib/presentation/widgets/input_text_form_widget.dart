import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/text_form_field.dart';

class InputTextFormWidget extends BaseWidget {
  final String? title;
  final bool isRequired;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool isDisable;
  final bool expands;
  final String? immobileLabelText;
  final int? minLines;
  final int? maxLines;

  const InputTextFormWidget({
    super.key,
    this.title,
    this.isRequired = false,
    this.controller,
    this.onChanged,
    this.isDisable = false,
    this.expands = false,
    this.immobileLabelText,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Dimension.radius8,
        ),
        border: Border.all(color: theme.colors.colorNeutral3, width: 1),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.padding16,
        vertical: Dimension.padding12,
      ),
      alignment: Alignment.centerLeft,
      child: TextsField(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        controller: controller,
        theme: theme,
        labelText: title,
        labelStyle: AppTextStyle.s16w400.copyWith(color: theme.colors.neutral10),
        widgetColor: Colors.white,
        // borderColor: theme.colors.dividerColor,
        isRequired: isRequired,
        onChanged: onChanged,
        enabled: !isDisable,
        expands: expands,
        immobileLabelText: immobileLabelText,
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }
}
