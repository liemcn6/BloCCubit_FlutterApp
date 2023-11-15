import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/bill/period_transaction.dart';
import 'package:home_care/presentation/modules/bill/bill_detail/widgets/bill_payment_detail.dart';
import 'package:home_care/presentation/widgets/card_view.dart';

class BillPaymentItem extends StatelessWidget {
  const BillPaymentItem({
    super.key,
    required this.theme,
    required this.item,
    required this.tr,
  });

  final AppTheme theme;
  final PeriodTransaction item;
  final AppLocalizations tr;

  @override
  Widget build(BuildContext context) {
    return CardView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      color: theme.colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.buildingServiceName,
                style: AppTextStyle.s16w600cNeutral13,
              ),
              GestureDetector(
                  onTap: () {
                    showBillPaymentDetail(context, item);
                  },
                  child: AppSvgs.icInfo),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '${tr.explanation}: ${item.note}',
            style: AppTextStyle.s12w400.withColor(theme.colors.neutral10),
          ),
          const SizedBox(height: 4),
          Text(
            '${tr.unit_price}: ${StringUtils.formatStringToCash(cash: item.unitPriceWithVat)}/${item.unitOfMeasureName}',
            style: AppTextStyle.s12w400.withColor(theme.colors.neutral10),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr.quantity_with_num(item.quantity.toInt()),
                style: AppTextStyle.s14w400.withColor(theme.colors.neutral13),
              ),
              Text(
                StringUtils.formatStringToCash(cash: item.totalPriceWithVat),
                style: AppTextStyle.s14w400.withColor(theme.colors.neutral13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
