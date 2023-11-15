import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/ticket/ticket_status.dart';
import 'package:home_care/presentation/modules/ticket/list_ticket/cubit/list_ticket_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';

class HeaderBody extends BaseWidget {
  const HeaderBody({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final cubit = context.watch<ListTicketCubit>();

    return Container(
      padding: const EdgeInsets.all(Dimension.padding8),
      margin: const EdgeInsets.only(bottom: Dimension.margin4),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Row(
          children: cubit.state.statusTitles
              .map(
                (val) => buttonStatus(
                  key: val.key,
                  title: TicketStatus.convertTicketStatusToString(
                    lang: tr,
                    status: val.status,
                  ),
                  isChoice: val.isChoice ?? false,
                  onTap: () {
                    cubit.changeStatus(
                      val.status,
                      val.statuses,
                    );
                  },
                  colors: appController.state.theme.colors,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget buttonStatus({
    required String title,
    bool isChoice = false,
    VoidCallback? onTap,
    Key? key,
    required AppColors colors,
  }) {
    return CardView(
      key: key,
      setMinWidth: true,
      color: isChoice ? colors.primary : Colors.transparent,
      onTap: onTap ?? () {},
      radius: 8,
      margin: const EdgeInsets.only(left: Dimension.margin8, top: Dimension.margin8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimension.padding8,
          horizontal: Dimension.padding12,
        ),
        child: Text(
          title,
          style: AppTextStyle.s14w600.copyWith(
            color: isChoice ? Colors.white : colors.neutral10,
          ),
        ),
      ),
    );
  }
}
