import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/bill_detail_view.dart';
import 'cubit/bill_detail_cubit.dart';

class BillDetailScreen extends StatelessWidget {
  final String billId;
  const BillDetailScreen(this.billId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillDetailCubit(billId),
      child: const BillDetailView(),
    );
  }
}
