import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/data/models/request/ticket/list_ticket_queries_request.dart';
import 'package:home_care/domain/entities/ticket/ticket_item.dart';
import 'package:home_care/domain/entities/ticket/ticket_status.dart';
import 'package:home_care/domain/usecases/ticket/list_ticket_usecase.dart';
import 'package:home_care/presentation/routes.dart';

part 'list_ticket_state.dart';

class ListTicketCubit extends Cubit<ListTicketState> {
  final usecase = getIt.get<ListTicketUseCase>();
  int pageIndex = 1;

  final _statusTitles = [
    TicketStatusTitle(
      key: GlobalKey(),
      status: TicketStatus.draft,
      statuses: const [TicketStatus.draft],
      isChoice: true,
    ),
    TicketStatusTitle(
      key: GlobalKey(),
      status: TicketStatus.open,
      statuses: const [TicketStatus.open],
    ),
    TicketStatusTitle(
      key: GlobalKey(),
      status: TicketStatus.received,
      statuses: const [TicketStatus.received],
    ),
    TicketStatusTitle(
      key: GlobalKey(),
      status: TicketStatus.processing,
      statuses: const [TicketStatus.processing],
    ),
    TicketStatusTitle(
      key: GlobalKey(),
      status: TicketStatus.closed,
      statuses: const [TicketStatus.closed],
    ),
  ];

  ListTicketCubit() : super(const ListTicketInitial());

  Future<void> init() async {
    if (isClosed) return;
    emit(state.copyWith(
      statusTitles: _statusTitles,
    ));
    _checkCreatePermission();
    await getListTicket();
  }

  void _checkCreatePermission() {
    final perms = AppStorage().authorities.permissions;

    emit(state.copyWith(
      canCreateTicket: perms?.isCreateTicket,
    ));
  }

  Future<void> onRefresh() async {
    pageIndex = 1;
    await getListTicket();
  }

  Future<void> loadMore() async {
    pageIndex++;
    await getListTicket();
  }

  Future<void> getListTicket() async {
    emit(state.copyWith(
      isLoaded: false,
    ));

    final queries = ListTicketQueriesRequest(
      pageIndex: pageIndex,
      pageSize: 30,
      statuses: state.statusTitles.where((e) => e.isChoice == true).firstOrNull?.statuses ?? [],
    );
    final listTicket = await usecase.getListTicket(queries);

    emit(state.copyWith(
      tickets: listTicket,
      isLoaded: true,
    ));
  }

  void changeStatus(status, statuses) {
    final newStatusTitles = _statusTitles.map((e) {
      if (e.status == status) {
        return e.copyWith(isChoice: true);
      } else {
        return e.copyWith(isChoice: false);
      }
    }).toList();

    emit(state.copyWith(
      statusTitles: newStatusTitles,
    ));

    getListTicket();
  }

  Future<void> navigateToCreateTicket(String? id) async {
    final result = await AppNavigator.push(Routes.detailTicket, id);
    if (result) {
      onRefresh();
    }
  }
}
