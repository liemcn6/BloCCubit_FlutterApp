import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/authentication/login/cubit/login_cubit.dart';
import 'package:home_care/presentation/modules/setting/setting_main/cubit/setting_cubit.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/image_network.dart';
import 'package:home_care/presentation/widgets/item_view.dart';

part 'components/settings_screen_view.dart';

class SettingMainScreen extends StatelessWidget {
  const SettingMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingCubit>(
          create: (BuildContext context) => SettingCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
      ],
      child: const SettingsScreenView(),
    );
  }
}
