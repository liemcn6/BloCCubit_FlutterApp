import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/ticket/detail_ticket/cubit/detail_ticket_cubit.dart';

import 'components/detail_ticket_view.dart';

class DetailTicketScreen extends StatelessWidget {
  final String ticketId;
  const DetailTicketScreen({required this.ticketId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailTicketCubit(),
      child: DetailTicketView(ticketId: ticketId),
    );
  }
}
