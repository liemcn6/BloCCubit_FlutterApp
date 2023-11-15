import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/community_newsletter/community_newsletter_details/cubit/community_newsletter_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/image_network.dart';

part 'components/community_newsletter_details_view.dart';

class CommunityNewsLetterDetails extends StatelessWidget {
  final String id;
  const CommunityNewsLetterDetails({super.key, this.id = ""});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommunityNewsletterDetailsCubit(),
      child: CommunityNewsletterDetailsView(id: id),
    );
  }
}
