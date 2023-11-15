import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/bill/bill_history/cubit/bill_history_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';
import 'package:home_care/presentation/widgets/loading_wrapper.dart';

class BillHistoryListView extends BaseWidget {
  const BillHistoryListView({Key? key}) : super(key: key);

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BillHistoryCubit>().getBillHistory();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final cubit = context.watch<BillHistoryCubit>();
    final state = cubit.state;
    final colors = appController.state.theme.colors;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.payment_history,
        ),
      ),
      body: LoadingWrapper(
          isLoaded: state.isLoaded,
          child: RefreshIndicator.adaptive(
            onRefresh: () => cubit.getBillHistory(),
            child: ListWidget(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.invoicePaymentHistories.length,
              itemBuilder: (context, index) {
                final billHistory = state.invoicePaymentHistories[index];
                return CardView(
                  color: colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  margin: const EdgeInsets.all(16),
                  radius: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateTimeUtils.formatDateTime(
                                    billHistory.transactionDate.millisecondsSinceEpoch,
                                    DateTimeUtils.dd_MM_yyyy) ??
                                '- -',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: colors.neutral13,
                            ),
                          ),
                          Text(
                            StringUtils.formatStringToCash(cash: billHistory.amount),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: colors.neutral13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${tr.bank_number}: ${billHistory.bankAccountNumber}',
                        style: AppTextStyle.s12w400.withColor(colors.neutral10),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${tr.bank}: ${billHistory.bankName.isEmpty ? '- -' : billHistory.bankName}',
                        style: AppTextStyle.s12w400.withColor(colors.neutral10),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${tr.note}: ${billHistory.note.isEmpty ? '- -' : billHistory.note}',
                        style: AppTextStyle.s12w400.withColor(colors.neutral10),
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
