import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/bill/bill_detail/cubit/bill_detail_cubit.dart';
import 'package:home_care/presentation/modules/bill/widgets/bill_status_tag.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';

class BillDetailHead extends BaseWidget {
  const BillDetailHead({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    final cubit = context.watch<BillDetailCubit>();

    return CardView(
      margin: const EdgeInsets.all(16),
      radius: 8,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Text(
                tr.totalMoney,
                style: TextStyle(
                  color: theme.colors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                StringUtils.formatStringToCash(cash: cubit.state.billDetail.totalAmount),
                style: TextStyle(
                  color: theme.colors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              renderLine(
                title: tr.before_vat,
                value: Text(
                  StringUtils.formatStringToCash(cash: cubit.state.billDetail.totalAmountNotVat),
                  style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
                ),
              ),
              const SizedBox(height: 12),
              renderLine(
                title: tr.vat,
                value: Text(
                  StringUtils.formatStringToCash(
                    cash: calculateVat(
                      cubit.state.billDetail.totalAmount,
                      cubit.state.billDetail.totalAmountNotVat,
                    ),
                  ),
                  style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Divider(
                  color: theme.colors.neutral3,
                  thickness: 1,
                ),
              ),
              renderInvoiceAmountInfo(tr, cubit, theme),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Divider(
                  color: theme.colors.neutral3,
                  thickness: 1,
                ),
              ),
              renderInvoiceInfo(tr, cubit, theme),
            ],
          )
        ],
      ),
    );
  }

  Column renderInvoiceInfo(AppLocalizations tr, BillDetailCubit cubit, AppTheme theme) {
    return Column(
      children: [
        renderLine(
          title: tr.invoice_number,
          value: Text(
            cubit.state.billDetail.invoiceNumber,
            style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
          ),
        ),
        const SizedBox(height: 12),
        renderLine(
          title: tr.status,
          value: BillStatusTag(status: cubit.state.billDetail.status),
        ),
        const SizedBox(height: 12),
        renderLine(
          title: tr.customer,
          value: Text(
            cubit.state.billDetail.organizationName,
            style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
            textAlign: TextAlign.right,
            maxLines: 1,
          ),
        ),
        const SizedBox(height: 12),
        renderLine(
          title: tr.invoice_date,
          value: Text(
            DateTimeUtils.formatDateTime(
                  cubit.state.billDetail.issueDate.millisecondsSinceEpoch,
                  DateTimeUtils.dd_MM_yyyy,
                ) ??
                '- -',
            style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
          ),
        ),
        const SizedBox(height: 12),
        renderLine(
          title: tr.invoice_address,
          value: Text(
            cubit.state.billDetail.invoiceIssuingAddress,
            style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(height: 12),
        renderLine(
          title: tr.description,
          isChainStart: true,
          value: Text(
            cubit.state.billDetail.note,
            style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Column renderInvoiceAmountInfo(AppLocalizations tr, BillDetailCubit cubit, AppTheme theme) {
    return Column(
      children: [
        renderLine(
          title: tr.totalMoney,
          value: Text(
            StringUtils.formatStringToCash(cash: cubit.state.billDetail.totalAmount),
            style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
          ),
        ),
        const SizedBox(height: 12),
        renderLine(
          title: tr.paid,
          value: Text(
            StringUtils.formatStringToCash(cash: cubit.state.billDetail.totalPaidAmount),
            style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
          ),
        ),
        const SizedBox(height: 12),
        renderLine(
          title: tr.remaining,
          value: Text(
            StringUtils.formatStringToCash(
                cash: cubit.state.billDetail.totalAmount - cubit.state.billDetail.totalPaidAmount),
            style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral13),
          ),
        ),
      ],
    );
  }

  Widget renderLine({required String title, required Widget value, bool isChainStart = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isChainStart ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyle.s14w400cBlack,
          ),
        ),
        Flexible(flex: 1, child: Align(alignment: Alignment.centerRight, child: value)),
      ],
    );
  }

  double calculateVat(double totalAmount, double totalAmountNotVat) {
    final vat = totalAmount - totalAmountNotVat;

    if (vat < 0) {
      return 0;
    }

    return vat;
  }
}
