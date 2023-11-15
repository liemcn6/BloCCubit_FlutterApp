import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/payment_management/payment_history.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class PaymentHistoryItem extends BaseWidget {
  final int index;
  final Function()? onPress;
  final PaymentHistory item;

  const PaymentHistoryItem({
    Key? key,
    required this.index,
    required this.onPress,
    required this.item,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;

    return Container(
      margin: EdgeInsets.fromLTRB(16, index == 0 ? Dimension.margin16 : 0, 16, 16),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          // onTap: () => onPress(),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr.paymentDate,
                  style: AppTextStyle.s12.copyWith(
                    color: theme.colors.gray700,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Utils.isNullOrEmpty(item.lastPaymentAt)
                          ? 'N/A'
                          : DateTimeUtils.formatDateTime(
                                DateTime.tryParse(item.lastPaymentAt!)?.millisecondsSinceEpoch,
                                'dd/MM/y',
                              ) ??
                              'N/A',
                      style: AppTextStyle.s16w400cBlack,
                    ),
                    Text(
                      StringUtils.formatStringToCash(
                        cash: item.paidAmount,
                      ),
                      style: AppTextStyle.s16w400cBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
