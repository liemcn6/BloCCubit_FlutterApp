import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/survey/survey_details/cubit/survey_details_cubit.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/home_icon.dart';
import 'package:readmore/readmore.dart';

part 'components/survey_details_view.dart';

class SurveyDetailsScreen extends StatelessWidget {
  final String? id;
  final String? buildingId;

  const SurveyDetailsScreen({super.key, this.id, this.buildingId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SurveyDetailsCubit(),
      child: SurveyDetailsView(
        id: id,
        buildingId: buildingId,
      ),
    );
  }
}
