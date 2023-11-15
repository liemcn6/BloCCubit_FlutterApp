import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/presentation/modules/emergency_support/components/emergency_support_view.dart';
import 'package:home_care/presentation/modules/emergency_support/cubit/emergency_support_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class EmergencySupportScreen extends BaseWidget {
  const EmergencySupportScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    return BlocProvider(
      create: (_) => EmergencySupportCubit(),
      child: const EmergencySupportView(),
    );
  }
}
