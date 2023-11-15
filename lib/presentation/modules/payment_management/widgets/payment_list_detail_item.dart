import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/payment_management/payment_item.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';

class PaymentListDetailItem extends BaseWidget {
  final int index;
  final Function()? onPress;
  final PaymentItem item;

  const PaymentListDetailItem({
    required this.index,
    required this.onPress,
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;

    return Container(
      margin: EdgeInsets.fromLTRB(16, index == 0 ? Dimension.margin16 : 0, 16, 24),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: onPress,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.only(
              top: 12,
              right: 16,
              left: 16,
              bottom: 12,
            ),
            decoration: BoxDecoration(
              color: theme.colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppSvgs.icContract,
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${tr.period} ${DateTimeUtils.formatDateTime(DateTime.parse(item.startDate).millisecondsSinceEpoch, 'M/yyyy')}',
                          style: AppTextStyle.s16wBoldBlack,
                        ),
                      ],
                    ),
                    CardView(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      color: Colors.transparent,
                      onTap: onPress,
                      child: Text(
                        tr.viewDetail,
                        style: TextStyle(
                          fontSize: 16,
                          color: theme.colors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    renderRow(title: tr.totalMoney, content: item.total.toString()),
                    renderRow(title: tr.paid, content: item.paidAmount.toString()),
                    renderRow(title: tr.unPaid, content: item.needToPay.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
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
