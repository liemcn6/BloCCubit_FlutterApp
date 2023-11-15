import '../bottom_sheet/row_item.dart';

class ServiceType {
  static const service = RowItem(
    id: 'SERVICE',
    code: 'TICKET_SERVICE',
    name: 'buildingSer',
  );
  static const technical = RowItem(
    id: 'TECHNICAL',
    code: 'TICKET_TECHNICAL',
    name: 'buildingTech',
  );
  static const administrative = RowItem(
    id: 'ADMINISTRATIVE',
    code: 'TICKET_ADMINISTRATIVE',
    name: 'buildingAdminstrative',
  );
  static const techAndSer = RowItem(
    id: 'TECHNICAL_SERVICE',
    code: 'TICKET_TECHNICAL_SERVICE',
    name: 'buildingTechAndSer',
  );

  static RowItem convertService(String? serviceType) {
    if (serviceType == service.id) {
      return service;
    }

    if (serviceType == technical.id) {
      return technical;
    }

    if (serviceType == administrative.id) {
      return administrative;
    }

    if (serviceType == techAndSer.id) {
      return techAndSer;
    }
    return const RowItem();
  }
}
