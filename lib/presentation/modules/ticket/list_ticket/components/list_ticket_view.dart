import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/presentation/modules/ticket/list_ticket/cubit/list_ticket_cubit.dart';
import 'package:home_care/presentation/modules/ticket/widgets/header_body.dart';
import 'package:home_care/presentation/modules/ticket/widgets/ticket_button.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';
import 'package:home_care/presentation/widgets/loading_wrapper.dart';

class ListTicketView extends BaseWidget {
  const ListTicketView({Key? key}) : super(key: key);

  @override
  onInit(BuildContext context) {
    context.read<ListTicketCubit>().init();
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<ListTicketCubit>();

    return Scaffold(
      backgroundColor: theme.colors.neutral2,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: t.ticket_list,
          visibleBack: false,
        ),
      ),
      body: Column(
        children: [
          const HeaderBody(),
          Expanded(
            child: LoadingWrapper(
              isLoaded: cubit.state.isLoaded,
              child: RefreshIndicator(
                onRefresh: cubit.onRefresh,
                child: Column(
                  children: [
                    Expanded(
                      child: ListWidget(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.state.tickets.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = cubit.state.tickets[index];
                          return TicketButton(
                            item: item,
                            onTap: () async {
                              final result = await AppNavigator.push(Routes.detailTicket, item.id);
                              if (result) {
                                cubit.onRefresh();
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: cubit.state.canCreateTicket,
        child: FloatingActionButton(
          backgroundColor: theme.colors.primary,
          shape: const CircleBorder(),
          onPressed: () async {
            final result = await AppNavigator.push(Routes.createTicket);
            if (result) {
              cubit.onRefresh();
            }
          },
          tooltip: 'Create',
          mini: false,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
