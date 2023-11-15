import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/ticket/list_ticket/cubit/list_ticket_cubit.dart';

import 'components/list_ticket_view.dart';

class ListTicketScreen extends StatelessWidget {
  const ListTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListTicketCubit(),
      child: const ListTicketView(),
    );
  }
}
