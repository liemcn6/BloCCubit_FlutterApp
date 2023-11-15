import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_model.dart';
import 'package:home_care/presentation/modules/contract/model/enum/statuses_enum.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class ItemContract extends BaseWidget {
  final int index;
  final Function onPress;
  final ContractModel item;

  const ItemContract({
    super.key,
    required this.index,
    required this.onPress,
    required this.item,
  });

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    return Container(
      margin: EdgeInsets.fromLTRB(16, index == 0 ? 16 : 0, 16, 8),
      child: Material(
        color: theme.colors.white,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () => onPress(),
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.contractNumber ?? 'N/A',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.s14wBoldBlack.copyWith(color: theme.colors.neutral13),
                      ),
                      Row(
                        children: [
                          Text(
                              DateTimeUtils.formatDateTime(
                                    DateTime.tryParse(item.effectiveDate ?? "")
                                        ?.millisecondsSinceEpoch,
                                    'dd/MM/y',
                                  ) ??
                                  'N/A',
                              style: AppTextStyle.s12w400
                                  .copyWith(color: theme.colors.colorNewTextSubTitle)),
                          Text(
                            ' - ',
                            style: AppTextStyle.s12w400cBlack,
                          ),
                          Text(
                              DateTimeUtils.formatDateTime(
                                    DateTime.tryParse(item.expirationDate ?? "")
                                        ?.millisecondsSinceEpoch,
                                    'dd/MM/y',
                                  ) ??
                                  'N/A',
                              style: AppTextStyle.s12w400
                                  .copyWith(color: theme.colors.colorNewTextSubTitle)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                renderStatus(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderStatus(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: GetValueStatuses.getStatuses(item.status ?? "").colorStatuses.withOpacity(0.6),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        GetValueStatuses.getNameWithLang(context, item.status ?? ""),
        style: TextStyle(
          color: GetValueStatuses.getStatuses(item.status ?? "").colorText,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
