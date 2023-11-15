import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/bill_history_list_view.dart';
import 'cubit/bill_history_cubit.dart';

class BillHistoryScreen extends StatelessWidget {
  final String billId;

  const BillHistoryScreen(this.billId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillHistoryCubit(billId),
      child: const BillHistoryListView(),
    );
  }
}
