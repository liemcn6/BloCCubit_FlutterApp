import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/payment_detail_view.dart';
import 'cubit/payment_detail_cubit.dart';

class PaymentDetailScreen extends StatelessWidget {
  final String paymentId;
  final String periodDate;
  final String contractNumber;

  const PaymentDetailScreen({
    Key? key,
    required this.paymentId,
    required this.periodDate,
    required this.contractNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentDetailCubit(paymentId),
      child: PaymentDetailView(
        paymentId: paymentId,
        periodDate: periodDate,
        contractNumber: contractNumber,
      ),
    );
  }
}
