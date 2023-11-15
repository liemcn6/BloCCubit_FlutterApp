import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/presentation/modules/authentication/login/cubit/login_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/button_view.dart';

class ButtonLogin extends BaseWidget {
  const ButtonLogin({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final cubit = context.watch<LoginCubit>();
    final theme = appController.state.theme;

    return ButtonView(
      disable: !cubit.state.isPasswordValid || !cubit.state.isUsernameValid,
      onPress: (data) {
        cubit.onTapLogin(data, context, theme, t);
        FocusManager.instance.primaryFocus?.unfocus();
      },
      title: t.login,
      titleStyle: TextStyle(
        color: theme.colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      radius: 38,
    );
  }
}
