import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_language.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/image_network.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import 'cubit/login_cubit.dart';
import 'widgets/button_login.dart';
import 'widgets/password_field.dart';
import 'widgets/username_field.dart';

part 'components/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: LoginView(),
    );
  }
}
