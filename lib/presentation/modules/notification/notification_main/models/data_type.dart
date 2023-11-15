import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DataType {
  static const survey = 'SURVEY';
  static const ticket = 'TICKET';
  static const complaint = 'COMPLAINT';

  static dataContent({required AppLocalizations lang, String? status}) {
    switch (status) {
      case DataType.ticket:
        {
          return lang.request;
        }
      case DataType.survey:
        {
          return lang.typeSurvey;
        }
      case DataType.complaint:
        {
          return lang.feedback;
        }
      default:
        {
          return lang.system;
        }
    }
  }
}
