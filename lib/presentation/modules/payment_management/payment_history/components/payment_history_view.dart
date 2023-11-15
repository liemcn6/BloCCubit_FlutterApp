import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/presentation/modules/payment_management/payment_history/cubit/payment_history_cubit.dart';
import 'package:home_care/presentation/modules/payment_management/widgets/payment_history_item.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';

class PaymentHistoryView extends BaseWidget {
  const PaymentHistoryView({Key? key}) : super(key: key);

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PaymentHistoryCubit>().onRefresh();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    final cubit = context.watch<PaymentHistoryCubit>();

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.paymentHistory,
        ),
      ),
      body: cubit.state.isLoaded
          ? LayoutBuilder(
              builder: (context, constraints) {
                return RefreshIndicator(
                  onRefresh: () => cubit.onRefresh(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      maxHeight: constraints.maxHeight,
                    ),
                    child: ListWidget(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: cubit.state.listPayments.length,
                      // enableLoadMore: provider.enableLoadMore,
                      // onLoadMore: () => cubit.onLoadMore(),
                      itemBuilder: (context, index) {
                        return PaymentHistoryItem(
                          index: index,
                          onPress: () async {},
                          item: cubit.state.listPayments[index],
                        );
                      },
                    ),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
