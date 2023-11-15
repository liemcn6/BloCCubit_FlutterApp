import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/response/ticket/review_response.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/presentation/modules/ticket/review_ticket/cubit/review_ticket_cubit.dart';
import 'package:home_care/presentation/modules/ticket/widgets/ticket_base.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/home_icon.dart';
import 'package:home_care/presentation/widgets/text_field.dart';

part 'components/review_ticket_view.dart';

class ReviewTicketScreen extends StatelessWidget {
  const ReviewTicketScreen({
    super.key,
    required this.ticketId,
    required this.review,
    required this.isReviewed,
  });

  final String ticketId;
  final ReviewResponse? review;
  final bool? isReviewed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReviewTicketCubit(),
      child: ReviewTicketView(
        ticketId: ticketId,
        review: review,
        isReviewed: isReviewed,
      ),
    );
  }
}
