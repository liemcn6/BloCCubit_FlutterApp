import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/ticket/ticket_item.dart';
import 'package:home_care/domain/entities/ticket/ticket_status.dart';
import 'package:home_care/presentation/modules/ticket/widgets/ticket_base.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/common_widget.dart';

class TicketButton extends BaseWidget {
  final TicketItem item;
  final bool isChoice;
  final VoidCallback? onTap;

  const TicketButton({
    super.key,
    required this.item,
    this.isChoice = false,
    this.onTap,
  });

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final TicketBase ticketWidget = TicketBase(
      theme: theme,
      baseContext: context,
      lang: t,
      width: DeviceUtils.getWidth(context),
    );

    return CardView(
      elevation: 0,
      color: Colors.white,
      onTap: onTap ?? () {},
      //padding: const EdgeInsets.all(Dimension.padding12),
      margin: const EdgeInsets.only(
        left: Dimension.margin16,
        right: Dimension.margin16,
        bottom: Dimension.margin12,
      ),
      radius: Dimension.radius8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.dateTime ?? '- -',
                style: AppTextStyle.s12.copyWith(color: theme.colors.gray700),
              ),
              const SizedBox(height: 8),
              CommonWidget.badge(
                TicketStatus.convertTicketStatusToString(
                  lang: t,
                  status: item.status,
                ),
                TicketStatus.convertTextColorTicketStatus(
                  item.status,
                  theme.colors,
                ),
                TicketStatus.convertBGColor2TicketStatus(
                  item.status,
                  theme.colors,
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            alignment: Alignment.bottomLeft,
            child: Text(
              item.content?.trim() ?? '',
              style: AppTextStyle.s14w600.copyWith(color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: item.averageRating == null ||
                    (item.status != TicketStatus.closed && item.status != TicketStatus.processed)
                ? 0
                : 8,
          ),
          ticketWidget.starRatingRow(
            isHide: item.averageRating == null ||
                (item.status != TicketStatus.closed && item.status != TicketStatus.processed),
            selectPos: item.averageRating != null ? item.averageRating!.toInt() : null,
            isSmall: true,
            paddingItem: const EdgeInsets.only(
              right: Dimension.padding8,
            ),
          ),
          SizedBox(
            height: item.averageRating == null ||
                    (item.status != TicketStatus.closed && item.status != TicketStatus.processed)
                ? 0
                : 6,
          ),
        ],
      ),
    );
  }
}
