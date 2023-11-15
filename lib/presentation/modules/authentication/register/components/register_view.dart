import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/authentication/register/cubit/register_cubit.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/button_view.dart';
import 'package:home_care/presentation/widgets/checkbox_custom.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/text_field.dart';

class RegisterView extends BaseWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    final cubit = context.watch<RegisterCubit>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.register,
          visibleBack: true,
        ),
      ),
      body: Form(
        key: cubit.formKey,
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextsField(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
                      borderType: BorderTypes.all,
                      controller: cubit.fullNameCtrl,
                      isRequired: true,
                      labelText: tr.full_name,
                      maxLength: 100,
                      keyboardType: TextInputType.name,
                      onChanged: cubit.setFullName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return tr.validate_name;
                        }
                        return null;
                      },
                      theme: theme,
                    ),
                    TextsField(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
                      borderType: BorderTypes.all,
                      controller: cubit.phoneNumCtrl,
                      labelText: tr.phone_number,
                      maxLength: 100,
                      keyboardType: TextInputType.phone,
                      onChanged: cubit.setPhoneNumber,
                      theme: theme,
                    ),
                    TextsField(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
                      borderType: BorderTypes.all,
                      controller: cubit.emailCtrl,
                      labelText: tr.email,
                      maxLength: 100,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: cubit.setEmail,
                      theme: theme,
                    ),
                    TextsField(
                      isRequired: true,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
                      borderType: BorderTypes.all,
                      controller: cubit.usernameCtrl,
                      labelText: tr.username,
                      maxLength: 100,
                      onChanged: cubit.setUsername,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return tr.validate_username;
                        }
                        return null;
                      },
                      theme: theme,
                    ),
                    TextsField(
                      isRequired: true,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
                      borderType: BorderTypes.all,
                      controller: cubit.passwordCtrl,
                      labelText: tr.password,
                      maxLength: 100,
                      hideText: true,
                      openEyeIcon: true,
                      onChanged: cubit.setPassword,
                      validator: (value) {
                        if (!RegExp(AppRegex.password).hasMatch(value ?? "")) {
                          return tr.invalid_password;
                        }

                        return null;
                      },
                      theme: theme,
                    ),
                    TextsField(
                      isRequired: true,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
                      borderType: BorderTypes.all,
                      controller: cubit.retypePasswordCtrl,
                      labelText: tr.confirm_password,
                      maxLength: 100,
                      hideText: true,
                      openEyeIcon: true,
                      onChanged: cubit.setConfirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return tr.invalid_password;
                        }

                        if (value != cubit.passwordCtrl.text) {
                          return tr.suggest_pass_again;
                        }

                        return null;
                      },
                      theme: theme,
                    ),
                    Text(
                      tr.suggest_password,
                      style: TextStyle(fontSize: 14, color: theme.colors.btnSecondary),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        CheckboxCustom(
                            padding: const EdgeInsets.only(left: Dimension.padding10),
                            value: cubit.state.checkBox,
                            checkedBorderColor: theme.colors.primary,
                            onChange: (value) {
                              cubit.setStateCheckbox(value);
                            }),
                        const SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // router.push(PrivacyPolicyScreen(title: lang.termsOfUse));
                              AppNavigator.push(Routes.privacyPolicy);
                            },
                            child: Text.rich(
                              //underline partially
                              TextSpan(
                                  style: const TextStyle(fontSize: 14),
                                  //global text style
                                  children: [
                                    TextSpan(text: tr.title_terms_policies),
                                    TextSpan(
                                      text: tr.title_terms_policies_under_line,
                                      style: const TextStyle(
                                        color: Color(0xFF0668D8),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    //partial text style
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ButtonView(
            disable: !cubit.state.checkBox,
            title: tr.register,
            onPress: (_) {
              cubit.handleRegister();
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 16,
          )
        ]),
      ),
    );
  }
}
