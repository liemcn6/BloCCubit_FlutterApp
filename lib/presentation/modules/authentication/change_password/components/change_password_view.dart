part of '../change_password_screen.dart';

class ChangePasswordView extends BaseWidget {
  const ChangePasswordView({super.key});

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations lang) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<ChangePasswordCubit>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Header(
              onPressed: () {
                Navigator.of(context).pop();
                cubit.setValidateOldPass(false);
                cubit.setValidateNewPass(false);
                cubit.setValidateNewPassAgain(false);
              },
              //   }},
              visibleBack: true,
              title: lang.change_pw,
            )),
        body: Form(
          key: cubit.state.formKeyCPW,
          child: Column(
            children: [
              const SizedBox(height: Dimension.padding16),
              TextsField(
                  openEyeIcon: true,
                  hideText: true,
                  borderType: BorderTypes.all,
                  labelText: lang.oldPassword,
                  controller: cubit.state.oldPasswordController,
                  onChanged: (text) {
                    if (text.isEmpty) {
                      cubit.setValidateOldPass(false);
                    }
                    cubit.submit(cubit.state.formKeyCPW);
                  },
                  validator: (value) {
                    if (value.toString().isNotEmpty) {
                      cubit.setValidateOldPass(true);
                      cubit.setValidateNewPass(false);
                      cubit.setValidateNewPassAgain(false);
                      return null;
                    }
                    return null;
                  },
                  theme: theme),
              const SizedBox(height: Dimension.padding16),
              TextsField(
                  openEyeIcon: true,
                  hideText: true,
                  borderType: BorderTypes.all,
                  labelText: lang.new_password,
                  controller: cubit.state.passwordController,
                  onChanged: (text) {
                    if (text.isEmpty) {
                      cubit.setValidateNewPass(false);
                    }
                    cubit.submit(cubit.state.formKeyCPW);
                  },
                  validator: (value) {
                    if (value.toString().isNotEmpty) {
                      if (!ValidateUtils.validateStructure(value!)) {
                        cubit.setValidateNewPass(false);
                        return lang.error_password;
                      } else {
                        cubit.setValidateNewPass(true);
                      }
                      return null;
                    }
                    return null;
                  },
                  theme: theme),
              const SizedBox(height: Dimension.padding16),
              TextsField(
                  openEyeIcon: true,
                  hideText: true,
                  borderType: BorderTypes.all,
                  labelText: lang.confirm_new_password,
                  controller: cubit.state.passwordAgainController,
                  onChanged: (text) {
                    if (text.isEmpty) {
                      cubit.setValidateNewPassAgain(false);
                    }
                    cubit.submit(cubit.state.formKeyCPW);
                  },
                  validator: (value) {
                    if (value.toString().isNotEmpty) {
                      if (!ValidateUtils.validateStructure(value!)) {
                        cubit.setValidateNewPassAgain(false);
                        return lang.error_password;
                      } else {
                        cubit.setValidateNewPassAgain(true);
                      }
                      if (!ValidateUtils.validateConfirmPass(
                          cubit.state.passwordController.text, value)) {
                        cubit.setValidateNewPassAgain(false);
                        return lang.suggest_pass_again;
                      } else {
                        cubit.setValidateNewPassAgain(true);
                      }
                      return null;
                    }
                    return null;
                  },
                  theme: theme),
              const SizedBox(height: Dimension.padding20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
                child: Text(
                  lang.suggest_password,
                  style: AppTextStyle.s14
                      .copyWith(color: theme.colors.neutral13, fontWeight: FontWeight.w400),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: Dimension.buttonHeight + 4,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ButtonView(
                    onPress: (_) {
                      if (cubit.state.validateOldPass == true &&
                          cubit.state.validateNewPass == true &&
                          cubit.state.validateNewPassAgain == true) {
                        cubit.changePassword(
                            context,
                            theme.colors,
                            cubit.state.passwordController.text,
                            cubit.state.oldPasswordController.text,
                            lang);
                      }
                    },
                    title: lang.update,
                    disable: cubit.state.validateOldPass == true &&
                            cubit.state.validateNewPass == true &&
                            cubit.state.validateNewPassAgain == true
                        ? false
                        : true,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ));
  }
}
