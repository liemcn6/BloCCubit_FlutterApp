import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_model.dart';
import 'package:home_care/presentation/modules/payment_management/payment_list/cubit/payment_list_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class PaymentListItem extends BaseWidget {
  final int index;
  final Function()? onPress;
  final ContractModel item;

  const PaymentListItem({
    required this.index,
    this.onPress,
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;

    return Container(
      margin: EdgeInsets.fromLTRB(
        16,
        index == 0 ? Dimension.margin16 : 8,
        16,
        8,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: onPress,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: theme.colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.contractNumber ?? '-',
                        maxLines: 2,
                        style: AppTextStyle.s14wBoldBlack,
                      ),
                      if (getStatus() == ContractPaymentStatus.unpaid)
                        renderRow(
                          title: t.paid,
                          content: item.paidAmount.toString(),
                          theme: theme,
                        ),
                      if (getStatus() == ContractPaymentStatus.unpaid)
                        renderRow(
                          title: t.remain,
                          content: item.needPay.toString(),
                          theme: theme,
                        ),
                      if (getStatus() == ContractPaymentStatus.paid)
                        renderRow(
                          title: t.amountNeedPay,
                          content: '0',
                          theme: theme,
                        ),
                    ],
                  ),
                ),
                renderStatus(context, theme: theme, tr: t),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderStatus(
    BuildContext context, {
    required AppTheme theme,
    required AppLocalizations tr,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: getBgColor(theme),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        getTitleStatus(tr),
        style: AppTextStyle.s12w400cBlack.copyWith(color: getTextColor(theme)),
      ),
    );
  }

  Widget renderRow({required String title, required String content, required AppTheme theme}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
      ),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: AppTextStyle.s12w400Black,
          ),
          Text(
            StringUtils.formatStringToCash(
              cash: content,
            ),
            style: AppTextStyle.s12w400Black,
          ),
        ],
      ),
    );
  }

  String getStatus() {
    if (item.needPay == 0) {
      return ContractPaymentStatus.paid;
    }
    return ContractPaymentStatus.unpaid;
  }

  String getTitleStatus(AppLocalizations tr) {
    switch (getStatus()) {
      case ContractPaymentStatus.paid:
        return tr.noDebt;
      case ContractPaymentStatus.unpaid:
        return tr.debt;
      default:
        return '-';
    }
  }

  Color getBgColor(AppTheme theme) {
    switch (getStatus()) {
      case ContractPaymentStatus.paid:
        return theme.colors.green200.withOpacity(0.3);
      case ContractPaymentStatus.unpaid:
        return theme.colors.red;
      default:
        return theme.colors.green200.withOpacity(0.3);
    }
  }

  Color getTextColor(AppTheme theme) {
    switch (getStatus()) {
      case ContractPaymentStatus.unpaid:
        return theme.colors.white;
      case ContractPaymentStatus.paid:
        return theme.colors.green200;
      default:
        return theme.colors.green200;
    }
  }
}
