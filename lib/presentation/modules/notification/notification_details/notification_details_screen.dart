import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:flutter_html/flutter_html.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/notification/notification_details/cubit/notification_details_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:url_launcher/url_launcher.dart';

part 'components/notification_details_view.dart';

class NotificationDetailScreen extends StatelessWidget {
  final String? id;
  const NotificationDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationDetailsCubit(),
      child: NotificationDetailView(
        eventId: id,
      ),
    );
  }
}
