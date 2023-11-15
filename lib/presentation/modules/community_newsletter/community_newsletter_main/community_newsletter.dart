import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/community_newsletter/community_newsletter_main/cubit/community_newsletter_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/image_slider_widget.dart';
import 'package:home_care/presentation/widgets/large_header.dart';
import 'package:home_care/presentation/widgets/news_list_widget.dart';
import 'package:home_care/presentation/widgets/shimer_loading.dart';

part 'components/community_newsletter_view.dart';
// part 'cubit/community_newsletter_cubit.dart';
// part 'cubit/community_newsletter_state.dart';

class CommunityNewsletter extends StatelessWidget {
  const CommunityNewsletter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommunityNewsletterCubit(),
      child: const CommunityNewsletterView(),
    );
  }
}
