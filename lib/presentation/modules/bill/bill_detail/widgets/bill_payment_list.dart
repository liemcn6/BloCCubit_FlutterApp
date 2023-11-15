import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

import '../cubit/bill_detail_cubit.dart';
import 'bill_payment_item.dart';

class BillPaymentList extends BaseWidget {
  const BillPaymentList({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    final state = context.watch<BillDetailCubit>().state;

    return Visibility(
      visible: state.billDetail.periodTransactions.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              tr.payment_info,
              style: AppTextStyle.s16w600.copyWith(color: theme.colors.neutral13),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final item = state.billDetail.periodTransactions[index];
              return BillPaymentItem(theme: theme, item: item, tr: tr);
            },
            itemCount: state.billDetail.periodTransactions.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
