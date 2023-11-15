import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/payment_management/payment_detail/cubit/payment_detail_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/bottom_sheet_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';

class PlanBottomSheet extends BaseWidget {
  final PaymentDetailCubit cubit;
  const PlanBottomSheet({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;

    return BottomSheetWidget(
      title: tr.choosePlanType,
      showIconClose: true,
      onDismiss: () {
        cubit.onDismissFilter();
      },
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: DeviceUtils.getHeight3(context) / 4 * 3,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  CardView(
                    color: Colors.transparent,
                    radius: 0,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    onTap: () {
                      cubit.onChooseUnit(chooseAll: true);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: Dimension.padding16),
                      margin: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: theme.colors.border,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(tr.all, style: AppTextStyle.s16w400cBlack),
                          ),
                          Visibility(
                            visible: cubit.state.selectedAllUnit,
                            child: Icon(Icons.check, color: theme.colors.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                  for (var i = 0; i < cubit.state.unitsFilter.length; i++)
                    CardView(
                      color: Colors.transparent,
                      radius: 0,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      onTap: () {
                        cubit.onChooseUnit(item: cubit.state.unitsFilter[i]);
                        // Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: Dimension.padding16),
                        margin: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
                        decoration: BoxDecoration(
                          border: i == cubit.state.unitsFilter.length - 1
                              ? null
                              : Border(
                                  bottom: BorderSide(width: 1, color: theme.colors.border),
                                ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                cubit.state.unitsFilter[i].unitName ?? '',
                                style: AppTextStyle.s16w400cBlack,
                              ),
                            ),
                            Visibility(
                              visible: cubit.state.unitsFilter[i].selected,
                              child: Icon(Icons.check, color: theme.colors.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 12),
                ],
              ),
              CardView(
                  margin: const EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  title: tr.confirm,
                  onTap: () {
                    Navigator.pop(context);
                    cubit.onConfirmFilter();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

Future showPlanBottomSheet(
  BuildContext context, {
  required PaymentDetailCubit cubit,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: false,
    builder: (BuildContext context) {
      return PlanBottomSheet(
        cubit: cubit,
      );
    },
  );
}
