import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/ticket/ticket_status.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/loading_wrapper.dart';
import 'package:home_care/presentation/widgets/text_field.dart';

import '../../widgets/ticket_base.dart';
import '../cubit/create_ticket_cubit.dart';

class CreateTicketView extends BaseWidget {
  CreateTicketView({super.key});

  final GlobalKey<FormState> _formKeyCT = GlobalKey<FormState>();

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CreateTicketCubit>().init();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<CreateTicketCubit>();

    final TicketBase ticketWidget = TicketBase(
      theme: theme,
      baseContext: context,
      lang: t,
      width: 300,
    );

    return WillPopScope(
      onWillPop: () async {
        AppNavigator.pop(true);
        return true;
      },
      child: Scaffold(
        backgroundColor: theme.colors.neutral2,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Header(
            title: t.create_ticket,
            visibleBack: true,
            onPressed: () {
              AppNavigator.pop(true);
            },
            actions: [AppSvgs.icHome],
          ),
        ),
        body: LoadingWrapper(
          isLoaded: cubit.state.isLoaded,
          child: Form(
            key: _formKeyCT,
            child: ListView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                const SizedBox(height: 8),
                renderBody(context, cubit, ticketWidget, t),
                TextsField(
                  theme: theme,
                  margin: const EdgeInsets.all(Dimension.margin16),
                  controller: cubit.contentCtrl,
                  immobileLabelText: t.content,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  borderType: BorderTypes.all,
                  radius: Dimension.radius8,
                  maxLength: 2000,
                  minLines: 3,
                  maxLines: 4,
                  maxHeight: 240,
                  onChanged: (val) {
                    cubit.changeContent(val);
                  },
                  isRequired: false,
                  hintText: "",
                  hintStyle: TextStyle(fontSize: 16, color: theme.colors.gray400),
                  validator: (text) {
                    if (Utils.isNullOrEmpty(text)) {
                      return t.input_content_error;
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: Dimension.padding16),
                  padding: const EdgeInsets.symmetric(
                    //horizontal: Dimension.padding16,
                    vertical: Dimension.padding12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius8),
                      color: theme.colors.white),
                  child: ticketWidget.imageAddListView(
                    //title: t.document,
                    note: t.attached_image,
                    images: cubit.state.images,
                    onTapCamera: () {
                      cubit.onTapCamera();
                    },
                    onTapGallery: () {
                      cubit.onTapGallery(context);
                    },
                    onDel: (i) {
                      cubit.delImage(i);
                    },
                    onTapDocument: () {
                      cubit.onTapDocument();
                    },
                  ),
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
                  radius: Dimension.radius8,
                  minLines: 3,
                  maxHeight: 240,
                  onChanged: (val) {
                    cubit.changeNote(val);
                  },
                  maxLines: 4,
                  maxLength: 1000,
                  hintText: "",
                  //t.enter_content,
                  hintStyle: TextStyle(fontSize: 16, color: theme.colors.gray400),
                ),
                bottomButtons(context, cubit, t, theme.colors),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderBody(
    BuildContext context,
    CreateTicketCubit cubit,
    TicketBase ticketWidget,
    AppLocalizations t,
  ) {
    return Column(
      children: [
        ticketWidget.itemBorderView(
          title: t.building_name,
          value: cubit.state.building.name,
          isDisable: cubit.state.buildingsSize == 1,
          hintTitle: t.building_name_sort,
          isRequired: false,
          onTap: () {
            cubit.chooseBuilding(context);
          },
        ),
        ticketWidget.itemBorderView(
          title: t.floor,
          value: cubit.state.floors.map((e) => e.name).join(', '),
          hintTitle: t.floor,
          isRequired: false,
          isDisable: cubit.state.floorSize == 1 || Utils.isNullOrEmpty(cubit.state.building.id),
          onTap: () {
            cubit.chooseFloor(context);
          },
        ),
      ],
    );
  }

  Widget bottomButtons(
      BuildContext context, CreateTicketCubit cubit, AppLocalizations t, AppColors appColors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimension.padding16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardView(
            onTap: () async {
              Utils.dismissKeyboard();
              final rp = await cubit.createTicket(
                formKeyCT2: _formKeyCT,
                lang: t,
                status: TicketStatus.open,
              );
              if (rp && context.mounted) {
                WidgetUtils.showPopUpSuccess(
                    context: context,
                    content: t.content_sent_request_success,
                    titleButtonYes: t.create,
                    titleButtonNo: t.btn_close,
                    onTapYes: () {
                      Navigator.pop(context);
                      cubit.cleanData();
                    },
                    onTapNo: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
              }
            },
            disable: cubit.checkValidate(),
            title: t.create_ticket,
            margin: const EdgeInsets.only(top: Dimension.margin8),
          ),
          CardView(
            onTap: cubit.checkValidate()
                ? null
                : () async {
                    final rp = await cubit.createTicket(
                      formKeyCT2: _formKeyCT,
                      lang: t,
                      status: TicketStatus.draft,
                    );

                    if (rp && context.mounted) {
                      WidgetUtils.showPopUpSuccess(
                          context: context,
                          content: t.content_sent_draft_success,
                          titleButtonYes: t.create,
                          titleButtonNo: t.btn_close,
                          onTapYes: () {
                            Log.i('onTapYes');
                            Navigator.pop(context);
                            cubit.cleanData();
                          },
                          onTapNo: () async {
                            Navigator.pop(context);
                            Navigator.pop(context, true);
                          });
                    }
                  },
            title: t.save_draft,
            margin: const EdgeInsets.symmetric(vertical: Dimension.margin12),
            titleStyle: TextStyle(fontSize: 16, color: appColors.neutral10),
            color: Colors.white,
            border: Border.all(color: appColors.neutral3),
          ),
        ],
      ),
    );
  }
}
