import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/button_view.dart';

class RegisterSuccessScreen extends BaseWidget {
  const RegisterSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AppImages.backgroundApp,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSvgs.icSuccess,
              const SizedBox(height: 16),
              Text(
                tr.registerSuccess,
                style: TextStyle(
                  color: theme.colors.neutralDark13,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  tr.register_success_note,
                  style: TextStyle(
                    color: theme.colors.neutralDark13,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ButtonView(
                  title: tr.login,
                  onPress: (p0) {
                    AppNavigator.pushRoot(Routes.login);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
