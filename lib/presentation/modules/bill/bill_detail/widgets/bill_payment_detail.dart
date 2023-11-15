import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/bill/period_transaction.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/bottom_sheet_widget.dart';

class BillPaymentDetail extends BaseWidget {
  final PeriodTransaction item;
  const BillPaymentDetail(this.item, {Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final colors = appController.state.theme.colors;

    return BottomSheetWidget(
      title: tr.service_detail,
      iconCloseRight: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(children: [
            renderServiceItem(title: tr.service, value: item.buildingServiceName, colors: colors),
            renderServiceItem(title: tr.payment_id, value: item.id, colors: colors),
            renderServiceItem(title: tr.explanation, value: item.note, colors: colors),
            renderServiceItem(
              title: tr.number_of_month,
              value: item.totalMonth.floor().toString(),
              colors: colors,
            ),
            renderSeparateServiceItem(
              title: tr.quantity,
              value: item.quantity.floor().toString(),
              title2: tr.unit_2,
              value2: item.unitOfMeasureName,
              colors: colors,
            ),
            renderServiceItem(
              title: tr.unit_price,
              value: StringUtils.formatStringToCash(cash: item.unitPriceWithVat),
              colors: colors,
            ),
            renderServiceItem(
              title: tr.totalMoney,
              value: StringUtils.formatStringToCash(cash: item.totalPriceWithVat),
              colors: colors,
            ),
            renderServiceItem(
              title: tr.paid,
              value: StringUtils.formatStringToCash(cash: item.totalPaidAmount),
              colors: colors,
            ),
            renderServiceItem(
              title: tr.remaining,
              value: StringUtils.formatStringToCash(
                  cash: item.totalPriceWithVat - item.totalPaidAmount),
              colors: colors,
              withDivider: false,
            ),
          ]),
        ),
      ),
    );
  }

  Widget renderServiceItem({
    required String title,
    required String value,
    required AppColors colors,
    bool withDivider = true,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.isEmpty ? '- -' : title,
            style: AppTextStyle.s12w400.withColor(colors.colorNewTextSubTitle),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyle.s14w400.withColor(colors.neutral13),
          ),
          Visibility(
            visible: withDivider,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Divider(
                color: colors.dividerColor,
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget renderSeparateServiceItem({
    required String title,
    required String value,
    required String title2,
    required String value2,
    required AppColors colors,
    bool withDivider = true,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.isEmpty ? '- -' : title,
                      style: AppTextStyle.s12w400.withColor(colors.colorNewTextSubTitle),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: AppTextStyle.s14w400.withColor(colors.neutral13),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title2.isEmpty ? '- -' : title2,
                      style: AppTextStyle.s12w400.withColor(colors.colorNewTextSubTitle),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value2,
                      style: AppTextStyle.s14w400.withColor(colors.neutral13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: withDivider,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Divider(
                color: colors.dividerColor,
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}

showBillPaymentDetail(BuildContext context, PeriodTransaction item) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => BillPaymentDetail(item),
  );
}
