import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/payment_list_detail_view.dart';
import 'cubit/payment_list_detail_cubit.dart';

class PaymentListDetailScreen extends StatelessWidget {
  final String contractId;
  final String contractNo;

  const PaymentListDetailScreen({
    required this.contractId,
    required this.contractNo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentListDetailCubit(),
      child: PaymentListDetailView(contractId: contractId, contractNo: contractNo),
    );
  }
}
