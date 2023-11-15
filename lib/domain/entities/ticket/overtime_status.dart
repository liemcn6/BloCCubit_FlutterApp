import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OvertimeStatus {
  static const news = "NEW";
  static const waitApprove = 'WAIT_APPROVE';
  static const approve = 'APPROVED';
  static const reject = 'REJECTED';
  static const cancel = 'CANCELED';
  static const waitCancel = 'WAIT_CANCEL';
  static const List<String> all = [];
  static convertOvertimeStatusToButton(
      {required AppLocalizations lang, required status}) {
    switch (status) {
      case OvertimeStatus.news:
        {
          return lang.save_as_draft;
        }
      case OvertimeStatus.waitApprove:
        {
          return lang.waiting_for_approval;
        }
      case OvertimeStatus.waitCancel:
        {
          return lang.waiting_for_cancel;
        }
      case OvertimeStatus.approve:
        {
          return lang.approved;
        }
      case OvertimeStatus.reject:
        {
          return lang.rejected;
        }
      case OvertimeStatus.cancel:
        {
          return lang.cancelled;
        }
      default:
        {
          return lang.all;
        }
    }
  }
}