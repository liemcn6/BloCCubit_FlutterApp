import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/survey/do_survey/cubit/do_survey_cubit.dart';
import 'package:home_care/presentation/modules/survey/models/question_model.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/dialog_custom.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/home_icon.dart';
import 'package:home_care/presentation/widgets/radio_button.dart';
import 'package:home_care/presentation/widgets/text_field.dart';

part 'components/do_survey_view.dart';

class DoSurveyScreen extends StatelessWidget {
  final String? buildingId;
  final String? id;

  const DoSurveyScreen({super.key, this.id, this.buildingId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DoSurveyCubit(),
      child: DoSurveyView(
        id: id,
        buildingId: buildingId,
      ),
    );
  }
}
