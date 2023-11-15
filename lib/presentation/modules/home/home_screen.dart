import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/home/cubit/home_cubit.dart';
import 'package:home_care/presentation/modules/home/models/enum/home_type.dart';
import 'package:home_care/presentation/modules/home/models/home_model.dart';
import 'package:home_care/presentation/modules/home/widgets/home_bottom_sheet.dart';
import 'package:home_care/presentation/modules/home/widgets/home_button_widget.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/image_network.dart';
import 'package:home_care/presentation/widgets/image_slider_widget.dart';
import 'package:home_care/presentation/widgets/limited_access_widget.dart';
import 'package:home_care/presentation/widgets/news_list_homescreen_widget.dart';
import 'package:home_care/presentation/widgets/shimer_loading.dart';

part 'components/home_view.dart';

class HomeScreen extends StatelessWidget {
  final Function notifyParent;
  const HomeScreen({super.key, required this.notifyParent});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(notifyParent),
      child: const HomeView(),
    );
  }
}
