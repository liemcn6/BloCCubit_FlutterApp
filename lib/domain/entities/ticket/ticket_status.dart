import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';

final class TicketStatus {
  TicketStatus._();

  static const draft = "DRAFT";
  static const open = 'OPEN';
  static const received = 'RECEIVED';
  static const processing = 'IN_PROGRESS';
  static const processed = 'RESOLVED';
  static const closed = 'CLOSED';
  static const cancel = 'CANCELLED';
  static const all = '';

  static String convertTicketStatusToString({
    required AppLocalizations lang,
    String? status,
  }) {
    switch (status) {
      case TicketStatus.draft:
        {
          return lang.save_draft;
        }
      case TicketStatus.open:
        {
          return lang.waiting_for_receive;
        }
      case TicketStatus.received:
        {
          return lang.received;
        }
      case TicketStatus.processing:
        {
          return lang.processing;
        }
      case TicketStatus.processed:
        {
          return lang.processed;
        }
      case TicketStatus.closed:
        {
          return lang.processed;
        }
      case TicketStatus.cancel:
        {
          return lang.cancelled;
        }
      default:
        {
          return lang.all;
        }
    }
  }

  static Color convertTextColorTicketStatus(
    String? status,
    AppColors colors,
  ) {
    switch (status) {
      case TicketStatus.draft:
        {
          return Colors.black;
        }
      case TicketStatus.open:
        {
          return colors.yellow8;
        }
      case TicketStatus.received:
        {
          return colors.blue8;
        }
      case TicketStatus.processing:
        {
          return colors.purple8;
        }
      case TicketStatus.processed:
        {
          return colors.positive;
        }
      case TicketStatus.closed:
        {
          return colors.green8;
        }
      case TicketStatus.cancel:
        {
          return colors.white;
        }
      default:
        {
          return colors.positive;
        }
    }
  }

  static convertBGColor2TicketStatus(
    String? status,
    AppColors colors,
  ) {
    switch (status) {
      case TicketStatus.draft:
        {
          return colors.gray300;
        }
      case TicketStatus.open:
        {
          return colors.yellow1;
        }
      case TicketStatus.received:
        {
          return colors.blue1;
        }
      case TicketStatus.processing:
        {
          return colors.purple1;
        }
      case TicketStatus.processed:
        {
          return colors.green300;
        }
      case TicketStatus.closed:
        {
          return colors.green1;
        }
      case TicketStatus.cancel:
        {
          return colors.error;
        }
      default:
        {
          return colors.green300;
        }
    }
  }
}

class ReviewButtonType {
  static const see = "see review";
  static const edit = 'edit review';
  static const empty = 'empty review';
}
