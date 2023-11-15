import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/payment_management/plan_period.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class PlanItem extends BaseWidget {
  final int index;
  final Function()? onPress;
  final PlanPeriod item;

  const PlanItem({
    Key? key,
    required this.index,
    required this.onPress,
    required this.item,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    final listServices = item.periodTransactions.map((e) {
      return renderItemService(
        title: e.buildingServiceName!,
        quantity: e.totalMonth,
        unit: e.unit ?? "",
        price: e.totalPrice,
        visible: true,
        theme: theme,
        tr: tr,
      );
    }).toList();

    return Container(
      margin: EdgeInsets.fromLTRB(
        16,
        index == 0 ? Dimension.margin16 : 0,
        16,
        24,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: onPress,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Utils.isNullOrEmpty(item.unitName) ? tr.serviceWithoutPlan : item.unitName!,
                style: AppTextStyle.s12w400Black,
              ),
              Column(
                children: listServices,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderItemService({
    required String title,
    required double quantity,
    required String unit,
    required double price,
    required bool visible,
    required AppTheme theme,
    required AppLocalizations tr,
  }) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: const EdgeInsets.only(
          top: 8,
          left: 12,
          right: 12,
        ),
        padding: const EdgeInsets.only(
          top: 4,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: theme.colors.gray400,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.s12w400Black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${quantity.toStringAsFixed(0)} ${tr.month}",
                  style: AppTextStyle.s16w400cBlack,
                ),
                Text(
                  StringUtils.formatStringToCash(
                    cash: price,
                  ),
                  style: AppTextStyle.s16w400cBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
