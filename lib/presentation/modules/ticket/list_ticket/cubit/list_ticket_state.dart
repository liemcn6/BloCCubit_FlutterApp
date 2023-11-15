part of 'list_ticket_cubit.dart';

class TicketStatusTitle extends Equatable {
  final String? id;
  final String? status;
  final bool? isChoice;
  final GlobalKey key;
  final List<String>? statuses;

  const TicketStatusTitle({
    this.id,
    this.status,
    this.isChoice,
    required this.key,
    this.statuses,
  });

  TicketStatusTitle copyWith({
    String? id,
    String? status,
    bool? isChoice,
    GlobalKey? key,
    List<String>? statuses,
  }) {
    return TicketStatusTitle(
      id: id ?? this.id,
      status: status ?? this.status,
      isChoice: isChoice ?? this.isChoice,
      key: key ?? this.key,
      statuses: statuses ?? this.statuses,
    );
  }

  @override
  List<Object?> get props => [
        id,
        status,
        isChoice,
        key,
        statuses,
      ];
}

@immutable
class ListTicketState extends Equatable {
  final bool canCreateTicket;
  final bool isLoaded;
  final List<TicketItem> tickets;
  final List<TicketStatusTitle> statusTitles;

  const ListTicketState({
    this.canCreateTicket = false,
    this.isLoaded = false,
    this.tickets = const [],
    this.statusTitles = const [],
  });

  @override
  List<Object> get props => [
        canCreateTicket,
        isLoaded,
        tickets,
        statusTitles,
      ];

  copyWith({
    bool? canCreateTicket,
    bool? isLoaded,
    List<TicketItem>? tickets,
    List<TicketStatusTitle>? statusTitles,
  }) {
    return ListTicketState(
      canCreateTicket: canCreateTicket ?? this.canCreateTicket,
      isLoaded: isLoaded ?? this.isLoaded,
      tickets: tickets ?? this.tickets,
      statusTitles: statusTitles ?? this.statusTitles,
    );
  }
}

final class ListTicketInitial extends ListTicketState {
  const ListTicketInitial() : super();
}
