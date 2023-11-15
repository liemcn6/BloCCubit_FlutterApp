import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/app_cubit/app_state.dart';
import 'package:home_care/core/app_language.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/setting/language/cubit/change_language_cubit.dart';
import 'package:home_care/presentation/widgets/checkbox_custom.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/home_icon.dart';
import 'package:home_care/presentation/widgets/hr_widget.dart';

part 'components/language_screen_view.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeLanguageCubit(),
      child: const LanguageView(),
    );
  }
}
