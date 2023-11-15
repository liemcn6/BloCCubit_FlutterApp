import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/payment_list_view.dart';
import 'cubit/payment_list_cubit.dart';

class PaymentListScreen extends StatelessWidget {
  const PaymentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentListCubit(),
      child: const PaymentListView(),
    );
  }
}
