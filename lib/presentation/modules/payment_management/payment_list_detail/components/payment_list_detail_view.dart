import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/payment_management/payment_list_detail/cubit/payment_list_detail_cubit.dart';
import 'package:home_care/presentation/modules/payment_management/widgets/payment_list_detail_item.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';

class PaymentListDetailView extends BaseWidget {
  final String contractId;
  final String contractNo;
  const PaymentListDetailView({required this.contractId, required this.contractNo, Key? key})
      : super(key: key);

  @override
  onInit(BuildContext context) {
    context.read<PaymentListDetailCubit>().onRefresh(contractId);
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    final cubit = context.watch<PaymentListDetailCubit>();

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.paymentManagement,
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
                  onRefresh: () => cubit.onRefresh(contractId),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      maxHeight: constraints.maxHeight,
                    ),
                    child: ListWidget(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      listHeaderWidget: renderHeaderList(cubit, tr),
                      itemCount: cubit.state.listPayments.length,
                      // enableLoadMore: cubit.state.enableLoadMore,
                      onLoadMore: () => cubit.onLoadMore(),
                      itemBuilder: (context, index) {
                        return PaymentListDetailItem(
                          index: index,
                          onPress: () async {
                            await AppNavigator.push(Routes.paymentDetail, {
                              "paymentId": cubit.state.listPayments[index].leasingPaymentPeriodId,
                              "contractNumber": contractNo,
                              "periodDate": cubit.state.listPayments[index].startDate,
                            });
                          },
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

  Widget renderHeaderList(PaymentListDetailCubit cubit, AppLocalizations tr) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: tr.totalAmountToPay,
              style: AppTextStyle.s16w400cBlack,
              children: [
                TextSpan(
                  text:
                      " ${StringUtils.formatStringToCash(cash: cubit.state.statistic.totalNeedToPay)}",
                  style: AppTextStyle.s16w400cBlack,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "${tr.contract.toUpperCase()}: $contractNo",
            style: AppTextStyle.s16wBoldBlack,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
