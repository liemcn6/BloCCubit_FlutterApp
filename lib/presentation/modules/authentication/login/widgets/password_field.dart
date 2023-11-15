import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/authentication/login/cubit/login_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/text_field.dart';

class PasswordField extends BaseWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final cubit = context.watch<LoginCubit>();
    final appState = appController.state;
    final state = cubit.state;
    final theme = appState.theme;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextsField(
                isRequired: true,
                //borderType: BorderTypes.all,
                controller: cubit.passwordController,
                labelText: t.password,
                labelStyle:
                    AppTextStyle.s16w400cBlack.copyWith(color: theme.colors.disabledTextColor),
                openEyeIcon: true,
                hideText: true,
                openEyeIconColors: theme.colors.neutralDark13,
                //openCloseIcon: true,
                onChanged: cubit.passwordChanged,
                validator: (_) => !state.isPasswordValid ? t.invalid_password : null,
                theme: theme,
                //maxLength: 50,
                widgetColor: Colors.transparent,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                  // Not allow unicode
                  // FilteringTextInputFormatter.deny(RegExp(r'[^\x00-\x7F]')),
                ],
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
                  hintText: t.password,
                  focusColor: theme.colors.disabled,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: TextStyle(
                    color: theme.colors.disabled,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                suffixIcon: Visibility(
                  visible: state.isLocalAuthEnabled && state.mode == LoginMode.half,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InkWell(
                      onTap: () {
                        cubit.toggleBiometric();
                      },
                      child: Platform.isIOS
                          ? AppSvgs.icFaceId
                          : Icon(
                              Icons.fingerprint,
                              color: theme.colors.neutralDark13,
                            ),
                    ),
                  ),
                ),
              ),
            ),
            // Visibility(
            //   visible: ref.watch(isAuthWithBiometricProvider) && ref.watch(fullNameProvider) != "",
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: Dimensions.padding16),
            //     child: GestureDetector(
            //       onTap: () {
            //         viewModel.doAuth();
            //       },
            //       child: Platform.isAndroid
            //           ? Icon(
            //               Icons.fingerprint,
            //               color: theme.appColors.white,
            //             )
            //           : SvgPicture.asset(
            //               IconSvg.faceIdWhite,
            //               height: Dimensions.iconSize,
            //               width: Dimensions.iconSize,
            //             ),
            //     ),
            //   ),
            // ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimension.padding16),
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
