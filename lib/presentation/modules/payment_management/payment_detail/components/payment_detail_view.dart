import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/payment_management/payment_detail/cubit/payment_detail_cubit.dart';
import 'package:home_care/presentation/modules/payment_management/widgets/plan_bottom_sheet.dart';
import 'package:home_care/presentation/modules/payment_management/widgets/plan_item.dart';
import 'package:home_care/presentation/modules/payment_management/widgets/service_bottom_sheet.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';

class PaymentDetailView extends BaseWidget {
  final String paymentId;
  final String periodDate;
  final String contractNumber;

  const PaymentDetailView({
    Key? key,
    required this.paymentId,
    required this.periodDate,
    required this.contractNumber,
  }) : super(key: key);

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PaymentDetailCubit>().getPaymentDetail();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    final cubit = context.watch<PaymentDetailCubit>();

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.paymentManagement,
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return RefreshIndicator(
            onRefresh: () => cubit.onRefresh(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                maxHeight: constraints.maxHeight,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListWidget(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      listHeaderWidget: renderHeaderList(
                        context,
                        tr: tr,
                        cubit: cubit,
                        theme: theme,
                      ),
                      itemCount: cubit.state.units.length,
                      // listBottomWidget: renderPrice(ref),
                      itemBuilder: (context, index) {
                        return PlanItem(
                          index: index,
                          onPress: () async {},
                          item: cubit.state.units[index],
                        );
                      },
                    ),
                  ),
                  renderPrice(cubit, tr: tr, theme: theme),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget renderHeaderList(
    BuildContext context, {
    required AppLocalizations tr,
    required PaymentDetailCubit cubit,
    required AppTheme theme,
  }) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "${tr.contract.toUpperCase()}: $contractNumber",
            style: AppTextStyle.s16wBoldBlack,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            '${tr.period} ${DateTimeUtils.formatDateTime(DateTime.tryParse(periodDate)?.millisecondsSinceEpoch, 'M/yyyy')}',
            style: AppTextStyle.s16wBoldBlack,
            textAlign: TextAlign.left,
          ),
          renderInput(
            title: tr.choosePlan,
            value: cubit.getValuePlan(tr),
            onTap: () {
              showPlanBottomSheet(context, cubit: cubit);
            },
            tr: tr,
            theme: theme,
          ),
          renderInput(
            title: tr.serviceTypeFee,
            value: cubit.getValueService(tr),
            onTap: () {
              showServiceBottomSheet(context, cubit: cubit);
            },
            tr: tr,
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget renderInput({
    required String title,
    required String value,
    VoidCallback? onTap,
    required AppLocalizations tr,
    required AppTheme theme,
  }) {
    return Column(
      children: [
        CardView(
          color: Colors.white,
          onTap: onTap,
          padding: const EdgeInsets.all(Dimension.padding12),
          margin: const EdgeInsets.only(top: 12),
          border: Border.all(color: theme.colors.gray400),
          radius: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.s12w400Black,
                    ),
                    Text(
                      value,
                      style: AppTextStyle.s16w400cBlack,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: Dimension.padding8),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderPrice(
    PaymentDetailCubit cubit, {
    required AppLocalizations tr,
    required AppTheme theme,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: theme.colors.white,
          border: Border.all(
            color: theme.colors.gray400,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 0),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ]),
      child: Column(
        children: [
          renderRow(title: tr.totalMoney, content: cubit.state.detail.total.toString()),
          renderRow(title: tr.paid, content: cubit.state.detail.paidAmount.toString()),
          renderRow(title: tr.totalRemainMoney, content: cubit.state.detail.needToPay.toString()),
        ],
      ),
    );
  }

  Widget renderRow({required String title, required String content}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.s16w400cBlack,
          ),
          Text(
            StringUtils.formatStringToCash(
              cash: content,
            ),
            style: AppTextStyle.s16w400cBlack,
          ),
        ],
      ),
    );
  }
}
