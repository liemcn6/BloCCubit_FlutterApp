import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/notification/notification_main/cubit/notification_main_cubit.dart';
import 'package:home_care/presentation/modules/notification/notification_main/models/data_type.dart';
import 'package:home_care/presentation/modules/notification/notification_main/models/notification_model.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';
import 'package:home_care/presentation/widgets/slideable_action_custom_widget.dart';

part 'components/notification_main_view.dart';

class NotificationMainScreen extends StatelessWidget {
  const NotificationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationMainCubit(),
      child: const NotificationMainView(),
    );
  }
}
