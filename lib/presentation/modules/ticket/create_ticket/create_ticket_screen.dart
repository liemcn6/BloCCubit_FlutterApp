import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/ticket/create_ticket/cubit/create_ticket_cubit.dart';

import 'components/create_ticket_view.dart';

class CreateTicketScreen extends StatelessWidget {
  const CreateTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTicketCubit(),
      child: CreateTicketView(),
    );
  }
}
