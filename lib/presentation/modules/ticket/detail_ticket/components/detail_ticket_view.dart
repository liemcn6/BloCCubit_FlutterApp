import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/authentication/authorities.dart';
import 'package:home_care/domain/entities/ticket/ticket_status.dart';
import 'package:home_care/presentation/modules/ticket/widgets/detail_body.dart';
import 'package:home_care/presentation/modules/ticket/widgets/edit_draft_body.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/loading_wrapper.dart';

import '../cubit/detail_ticket_cubit.dart';

class DetailTicketView extends BaseWidget {
  final String ticketId;
  DetailTicketView({required this.ticketId, super.key});

  final GlobalKey<FormState> _formKeyDT = GlobalKey<FormState>();

  @override
  onInit(BuildContext context) {
    context.read<DetailTicketCubit>().init(ticketId);
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<DetailTicketCubit>();

    return WillPopScope(
      onWillPop: () async {
        if (cubit.state.isUpdate && cubit.state.status == TicketStatus.draft) {
          cubit.changeUpdateMode();
        } else {
          AppNavigator.pop(true);
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: theme.colors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Header(
            title: t.ticket_detail,
            visibleBack: true,
            actions: [AppSvgs.icHome],
            onPressed: () {
              if (cubit.state.isUpdate && cubit.state.status == TicketStatus.draft) {
                cubit.changeUpdateMode();
              } else {
                AppNavigator.pop(true);
              }
            },
          ),
        ),
        body: LoadingWrapper(
          isLoaded: cubit.state.isLoaded,
          child: Form(
            key: _formKeyDT,
            child: RefreshIndicator(
              onRefresh: () async {
                cubit.handlerRefresh(ticketId);
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        renderBody(cubit.state.status ?? TicketStatus.draft, cubit.state.isUpdate),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: cubit.state.status == TicketStatus.draft,
                    child: bottomDraftButtons(cubit, t, theme),
                  ),
                  Visibility(
                    visible: cubit.state.reviewButtonType != ReviewButtonType.empty &&
                        cubit.state.status == TicketStatus.closed,
                    child: bottomReviewButtons(cubit, t, theme),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget renderBody(String status, bool isEdit) {
    if (status == TicketStatus.draft && isEdit) {
      return const EditDraftBody();
    }

    return const DetailBody();
  }

  Widget bottomReviewButtons(DetailTicketCubit cubit, AppLocalizations lang, AppTheme theme) {
    if (cubit.state.userProfile?.accountType == AccountType.customer) {
      return CardView(
        onTap: () async {
          final result = await AppNavigator.push(Routes.reviewTicket, {
            "ticketId": cubit.state.detailTicket.id ?? "",
            "review": cubit.state.review,
            "isReviewed": cubit.state.reviewButtonType == ReviewButtonType.edit ? true : false
          });
          if (result) {
            cubit.handlerRefresh(ticketId);
          }
        },
        title: cubit.state.reviewButtonType == ReviewButtonType.edit ? lang.review : lang.seeReview,
        margin: const EdgeInsets.only(
          top: Dimension.margin8,
          bottom: Dimension.margin12,
          right: Dimension.margin16,
          left: Dimension.margin16,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget bottomDraftButtons(DetailTicketCubit cubit, AppLocalizations t, AppTheme theme) {
    return Container(
      margin: const EdgeInsets.only(top: Dimension.margin8),
      padding: const EdgeInsets.symmetric(horizontal: Dimension.padding16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardView(
            onTap: () {
              if (cubit.state.isUpdate) {
                cubit.updateTicket(
                  formKeyCT3: _formKeyDT,
                  lang: t,
                  status: TicketStatus.open,
                );
                return;
              }
              cubit.changeUpdateMode();
            },
            disable: cubit.state.isUpdate && cubit.checkValidate(),
            title: cubit.state.isUpdate ? t.send_request : t.update,
            margin: EdgeInsets.zero,
          ),
          CardView(
            onTap: () {
              if (cubit.checkValidate()) {
                return;
              }

              cubit.updateTicket(
                formKeyCT3: _formKeyDT,
                lang: t,
                status: cubit.state.isUpdate ? TicketStatus.draft : TicketStatus.open,
              );
            },
            title: cubit.state.isUpdate ? t.save_as_draft : t.send_request,
            margin: const EdgeInsets.symmetric(vertical: Dimension.margin12),
            titleStyle: TextStyle(
              fontSize: 16,
              color:
                  cubit.checkValidate() ? theme.colors.disabledBorder : theme.colors.btnSecondary,
            ),
            color: Colors.white,
            border: Border.all(
              color:
                  cubit.checkValidate() ? theme.colors.disabledBorder : theme.colors.btnSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
