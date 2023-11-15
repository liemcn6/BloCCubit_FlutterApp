import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/payment_history_view.dart';
import 'cubit/payment_history_cubit.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentHistoryCubit(),
      child: const PaymentHistoryView(),
    );
  }
}
