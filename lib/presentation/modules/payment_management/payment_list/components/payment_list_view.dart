import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/payment_management/payment_list/cubit/payment_list_cubit.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';

import '../../widgets/payment_list_item.dart';

class PaymentListView extends BaseWidget {
  const PaymentListView({Key? key}) : super(key: key);

  @override
  onInit(BuildContext context) {
    context.read<PaymentListCubit>().onRefresh();
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<PaymentListCubit>();

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: t.paymentManagement,
          // visibleBack: false,
          actions: [
            CardView(
              onTap: () {
                AppNavigator.push(Routes.paymentHistory);
              },
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.zero,
              child: Icon(
                Icons.history_rounded,
                color: theme.colors.white,
              ),
            ),
          ],
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
                      listHeaderWidget: renderHeaderList(cubit: cubit, tr: t),
                      itemCount: cubit.state.paymentList.length,
                      // enableLoadMore: provider.enableLoadMore,
                      onLoadMore: () => cubit.onLoadMore(),
                      itemBuilder: (context, index) {
                        return PaymentListItem(
                          index: index,
                          onPress: () async {
                            await AppNavigator.push(Routes.paymentListDetail, {
                              'contractId': cubit.state.paymentList[index].id,
                              'contractNo': cubit.state.paymentList[index].contractNumber,
                            });
                          },
                          item: cubit.state.paymentList[index],
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

  Widget renderHeaderList({
    required PaymentListCubit cubit,
    required AppLocalizations tr,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tr.totalDebt.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            StringUtils.formatStringToCash(
              cash: cubit.state.statistic.totalNeedToPay,
            ),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
