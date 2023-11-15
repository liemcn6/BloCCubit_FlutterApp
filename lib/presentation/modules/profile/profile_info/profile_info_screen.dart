import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/profile/profile_edit/models/gender_type_enum.dart';
import 'package:home_care/presentation/modules/profile/profile_info/cubit/profile_info_cubit.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/button_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/image_network.dart';
import 'package:home_care/presentation/widgets/item_info_widget.dart';

part 'components/profile_info_view.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileInfoCubit(),
      child: const ProfileInfoView(),
    );
  }
}
