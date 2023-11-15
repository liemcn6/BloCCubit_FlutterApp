import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/ticket/detail_ticket/cubit/detail_ticket_cubit.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/text_field.dart';

import 'ticket_base.dart';

class EditDraftBody extends BaseWidget {
  const EditDraftBody({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<DetailTicketCubit>();
    final TicketBase ticketWidget = TicketBase(
      theme: theme,
      baseContext: context,
      lang: t,
      width: DeviceUtils.getWidth(context),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ticketWidget.itemBorderView(
          title: t.building_name,
          value: cubit.state.building.name,
          isDisable: cubit.state.buildingSize == 1,
          hintTitle: t.choose_building,
          isRequired: true,
          onTap: () {
            cubit.chooseBuilding(context);
          },
        ),
        ticketWidget.itemBorderView(
          title: t.floor,
          value: cubit.state.floors.map((e) => e.name).join(', '),
          hintTitle: t.choose_floor,
          isRequired: true,
          isDisable: cubit.state.floorSize == 1 || Utils.isNullOrEmpty(cubit.state.building.id),
          onTap: () {
            cubit.chooseFloor(context);
          },
        ),
        CardView(
          color: Colors.white,
          padding: const EdgeInsets.all(Dimension.padding12),
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(
            left: Dimension.margin16,
            right: Dimension.margin16,
            top: Dimension.margin16,
          ),
          radius: 5,
          child: ticketWidget.statusView(cubit.state.status),
        ),
        TextsField(
          theme: theme,
          margin: const EdgeInsets.all(Dimension.margin16),
          controller: cubit.contentCtrl,
          immobileLabelText: t.request_content,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          borderType: BorderTypes.all,
          maxLength: 2000,
          minLines: 3,
          maxLines: 4,
          onChanged: (val) {
            cubit.changeContent(val);
          },
          isRequired: true,
          hintText: t.enter_content,
          hintStyle: TextStyle(fontSize: 16, color: theme.colors.gray400),
          validator: (text) {
            if (Utils.isNullOrEmpty(text)) {
              return t.input_content_error;
            }
            return null;
          },
        ),
        ticketWidget.imageAddListView(
          images: cubit.state.images,
          onTapCamera: () {
            cubit.onTapCamera(context);
          },
          onTapGallery: () {
            cubit.onTapGallery(context);
          },
          onTapDocument: () {
            cubit.onTapDocument();
          },
          onDel: (i) {
            cubit.deleteImage(i);
          },
        ),
        TextsField(
          theme: theme,
          margin: const EdgeInsets.all(Dimension.margin16),
          controller: cubit.noteCtrl,
          immobileLabelText: t.note,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          borderType: BorderTypes.all,
          minLines: 3,
          maxLines: 4,
          maxLength: 1000,
          onChanged: (val) {
            cubit.changeNote(val);
          },
          hintText: t.enter_note,
          hintStyle: TextStyle(fontSize: 16, color: theme.colors.gray400),
        ),
      ],
    );
  }
}
