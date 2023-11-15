import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';

import '../../../../../core/core.dart';
import '../../../../widgets/base_widget.dart';
import '../../../../widgets/text_field.dart';
import '../cubit/login_cubit.dart';

class UserNameField extends BaseWidget {
  const UserNameField({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final cubit = context.watch<LoginCubit>();
    final appState = appController.state;
    final theme = appState.theme;
    final state = cubit.state;

    return Column(
      children: [
        TextsField(
          isRequired: true,
          //margin: const EdgeInsets.symmetric(horizontal: Dimensions.margin16),
          //borderType: BorderTypes.all,
          controller: cubit.usernameController,
          labelText: t.username,
          //openEyeIcon: true,
          onChanged: cubit.usernameChanged,
          validator: (_) => !state.isUsernameValid ? t.invalid_username : null,
          theme: appState.theme,
          //maxLength: 50,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          padding: const EdgeInsets.symmetric(
            vertical: Dimension.padding12,
            horizontal: Dimension.padding16,
          ),
          widgetColor: Colors.transparent,
          style: TextStyle(
            color: theme.colors.neutralDark13,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            hintText: t.username,
            filled: true,
            fillColor: Colors.transparent,
            focusColor: Colors.white,
            hintStyle: TextStyle(
              color: theme.colors.disabled,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Dimension.margin16,
            right: Dimension.padding16,
            bottom: Dimension.padding16,
          ),
          child: Divider(
            color: theme.colors.disabled,
            thickness: 1,
            height: 1,
          ),
        )
      ],
    );
  }
}
