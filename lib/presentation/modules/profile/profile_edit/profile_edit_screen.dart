import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/profile/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:home_care/presentation/modules/profile/profile_edit/models/gender_type_enum.dart';
import 'package:home_care/presentation/modules/profile/profile_info/cubit/profile_info_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/bottom_sheet_widget.dart';
import 'package:home_care/presentation/widgets/button_view.dart';
import 'package:home_care/presentation/widgets/calendar_bottom_sheet.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/image_network.dart';
import 'package:home_care/presentation/widgets/item_btsheet.dart';
import 'package:home_care/presentation/widgets/radio_button.dart';
import 'package:home_care/presentation/widgets/text_field.dart';

part 'components/profile_edit_view.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileEditCubit>(create: (_) => ProfileEditCubit()),
        BlocProvider<ProfileInfoCubit>(
          create: (_) => ProfileInfoCubit(),
        ),
      ],
      child: const ProfileEditView(),
    );
  }
}
