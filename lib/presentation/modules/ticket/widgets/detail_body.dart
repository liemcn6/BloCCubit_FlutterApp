import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/response/ticket/issue_link_response.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/entities/ticket/ticket_status.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/file_preview.dart';

import '../detail_ticket/cubit/detail_ticket_cubit.dart';
import 'ticket_base.dart';
import 'ticket_tag_box.dart';

class DetailBody extends BaseWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    final cubit = context.watch<DetailTicketCubit>();
    final TicketBase ticketWidget = TicketBase(
      theme: theme,
      baseContext: context,
      lang: tr,
      width: DeviceUtils.getWidth(context),
    );

    return CardView(
      color: Colors.white,
      margin: const EdgeInsets.all(Dimension.margin16),
      padding: const EdgeInsets.symmetric(horizontal: Dimension.padding16),
      child: Column(
        children: [
          itemView(
            context: context,
            theme: theme,
            noTopBorder: true,
            title: tr.location,
            value: StringUtils.convertFloorBuildingToString(
              lang: tr,
              floor: cubit.state.floors.map((e) => e.name ?? "").join(', '),
              buildingName: cubit.state.building.name ?? '',
            ),
          ),
          Visibility(
            visible: !Utils.isNullOrEmpty(cubit.state.company.name),
            child: itemView(
              context: context,
              theme: theme,
              title: tr.company,
              value: cubit.state.company.name ?? '',
            ),
          ),
          Visibility(
            visible: !Utils.isNullOrEmpty(cubit.state.requester.name),
            child: itemView(
              context: context,
              theme: theme,
              title: tr.requester,
              value: cubit.state.requester.name ?? '',
            ),
          ),
          Visibility(
            visible: !Utils.isNullOrEmpty(cubit.state.service.name),
            child: itemView(
              context: context,
              theme: theme,
              title: tr.service,
              value: tr.services(cubit.state.service.name ?? ''),
            ),
          ),
          itemView(
            context: context,
            theme: theme,
            child: ticketWidget.statusView(cubit.state.status),
          ),
          Visibility(
            visible: !Utils.isNullOrEmpty(cubit.state.service.name) &&
                cubit.state.status == TicketStatus.closed,
            child: itemView(
              context: context,
              theme: theme,
              title: tr.processor,
              value: tr.services(cubit.state.service.name ?? ''),
            ),
          ),
          Visibility(
            visible: cubit.state.status == TicketStatus.closed,
            child: itemView(
              context: context,
              theme: theme,
              title: tr.assignee,
              value: cubit.state.assignee.name ?? '',
            ),
          ),
          Visibility(
            visible: cubit.state.status == TicketStatus.cancel &&
                cubit.state.detailTicket.issueLinks?.isNotEmpty == true,
            child: itemView(
              context: context,
              theme: theme,
              title: tr.copied_ticket,
              widgetValue: TicketTagBox(
                data: cubit.state.detailTicket.issueLinks ?? [],
                onTagTap: (ticketId) {},
              ),
            ),
          ),
          Visibility(
            visible: cubit.state.detailTicket.parentId != null,
            child: itemView(
              context: context,
              theme: theme,
              title: tr.copied_ticket_from,
              widgetValue: TicketTagBox(
                data: [
                  IssueLinkResponse(
                    id: cubit.state.detailTicket.parentId,
                    code: cubit.state.detailTicket.parentCode,
                  )
                ],
                onTagTap: (ticketId) {},
              ),
            ),
          ),
          itemView(
            context: context,
            theme: theme,
            title: tr.request_content,
            value: cubit.state.content,
          ),
          imageListView(
            context: context,
            theme: theme,
            lang: tr,
            ticketWidget: ticketWidget,
            title: tr.document,
            images: cubit.state.images,
          ),
          Visibility(
            visible: !Utils.isNullOrEmpty(cubit.state.note),
            child: itemView(
              context: context,
              theme: theme,
              title: tr.note,
              value: cubit.state.note,
            ),
          ),
          Visibility(
            visible: cubit.state.status == TicketStatus.closed &&
                !Utils.isNullOrEmpty(cubit.state.feedback),
            child: itemView(
              context: context,
              theme: theme,
              title: tr.staff_feedback,
              value: cubit.state.feedback,
            ),
          ),
          Visibility(
            visible:
                cubit.state.status == TicketStatus.closed && cubit.state.imagesAccept.isNotEmpty,
            child: imageListView(
              context: context,
              theme: theme,
              lang: tr,
              ticketWidget: ticketWidget,
              title: tr.acceptance_document,
              images: cubit.state.imagesAccept,
            ),
          ),
          Visibility(
            visible: cubit.state.status == TicketStatus.closed &&
                !Utils.isNullOrEmpty(cubit.state.detailTicket.confirmationNote),
            child: itemView(
              context: context,
              theme: theme,
              title: tr.leader_result_confirmation,
              value: cubit.state.detailTicket.confirmationNote ?? '',
            ),
          ),
          Visibility(
            visible:
                cubit.state.status == TicketStatus.closed && cubit.state.imagesAccept.isNotEmpty,
            child: imageListView(
              context: context,
              theme: theme,
              lang: tr,
              ticketWidget: ticketWidget,
              title: tr.result_confirmation_document,
              images: cubit.state.imagesConfirm,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemView({
    required BuildContext context,
    String title = '',
    String value = '',
    bool noTopBorder = false,
    Widget? child,
    double distanceItem = 12,
    Widget? widgetValue,
    required AppTheme theme,
  }) {
    return Container(
      decoration: noTopBorder
          ? const BoxDecoration()
          : BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: theme.colors.border),
              ),
            ),
      margin: EdgeInsets.only(bottom: distanceItem),
      width: DeviceUtils.getWidth(context),
      padding: EdgeInsets.only(top: distanceItem),
      child: child ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: theme.colors.gray700,
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(top: Dimension.padding4),
                child: widgetValue ??
                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
              ),
            ],
          ),
    );
  }

  Widget imageListView({
    required BuildContext context,
    String? title,
    required List<ImageModel> images,
    bool noTopBorder = false,
    required TicketBase ticketWidget,
    required AppLocalizations lang,
    required AppTheme theme,
  }) {
    return Visibility(
      visible: !Utils.isNullOrEmpty(images),
      child: itemView(
        theme: theme,
        context: context,
        noTopBorder: noTopBorder,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? lang.image,
              style: TextStyle(
                color: theme.colors.gray700,
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < images.length; i++)
                    ticketWidget.imageView(
                      image: images[i],
                      pos: i,
                      onTap: () {
                        showFilePreviewList(
                          files: images,
                          context: context,
                          initialPage: i,
                        );
                      },
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
