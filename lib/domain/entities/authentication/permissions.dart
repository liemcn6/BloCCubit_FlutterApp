class Permissions {
  final bool isLeasingContractView;
  final bool isNewsView;
  final bool isTicketView;
  final bool isCreateTicket;
  final bool isPaymentView;
  final bool isParkingRegistrationView;
  final bool isParkingRegistrationCreate;
  final bool isParkingRegistrationUpdate;
  final bool isParkingRegistrationDelete;
  final bool isVehicleView;
  final bool isVehicleUpdate;
  final bool isBookingServiceView;
  final bool isBookingServiceCreate;
  final bool isBookingServiceUpdate;
  final bool isSurveyView;
  final bool isInvoiceView;

  const Permissions({
    required this.isLeasingContractView,
    required this.isNewsView,
    required this.isTicketView,
    required this.isCreateTicket,
    required this.isPaymentView,
    required this.isParkingRegistrationView,
    required this.isParkingRegistrationCreate,
    required this.isParkingRegistrationUpdate,
    required this.isParkingRegistrationDelete,
    required this.isVehicleView,
    required this.isVehicleUpdate,
    required this.isBookingServiceView,
    required this.isBookingServiceCreate,
    required this.isBookingServiceUpdate,
    required this.isSurveyView,
    required this.isInvoiceView,
  });

  factory Permissions.fromListAuthorities(List<String>? authorities, bool? isRoot) {
    if (isRoot == true) {
      return const Permissions(
        isLeasingContractView: true,
        isNewsView: true,
        isTicketView: true,
        isCreateTicket: true,
        isPaymentView: true,
        isParkingRegistrationView: true,
        isParkingRegistrationCreate: true,
        isParkingRegistrationUpdate: true,
        isParkingRegistrationDelete: true,
        isVehicleView: true,
        isVehicleUpdate: true,
        isBookingServiceView: true,
        isBookingServiceCreate: true,
        isBookingServiceUpdate: true,
        isSurveyView: true,
        isInvoiceView: true,
      );
    }
    return Permissions(
      isLeasingContractView: authorities?.contains(PermissionKeys.leasingContractView) ?? false,
      isNewsView: authorities?.contains(PermissionKeys.newsView) ?? false,
      isTicketView: authorities?.contains(PermissionKeys.ticketView) ?? false,
      isCreateTicket: authorities?.contains(PermissionKeys.createTicket) ?? false,
      isPaymentView: authorities?.contains(PermissionKeys.paymentView) ?? false,
      isParkingRegistrationView:
          authorities?.contains(PermissionKeys.parkingRegistrationView) ?? false,
      isParkingRegistrationCreate:
          authorities?.contains(PermissionKeys.parkingRegistrationCreate) ?? false,
      isParkingRegistrationUpdate:
          authorities?.contains(PermissionKeys.parkingRegistrationUpdate) ?? false,
      isParkingRegistrationDelete:
          authorities?.contains(PermissionKeys.parkingRegistrationDelete) ?? false,
      isVehicleView: authorities?.contains(PermissionKeys.vehicleView) ?? false,
      isVehicleUpdate: authorities?.contains(PermissionKeys.vehicleUpdate) ?? false,
      isBookingServiceView: authorities?.contains(PermissionKeys.bookingServiceView) ?? false,
      isBookingServiceCreate: authorities?.contains(PermissionKeys.bookingServiceCreate) ?? false,
      isBookingServiceUpdate: authorities?.contains(PermissionKeys.bookingServiceUpdate) ?? false,
      isSurveyView: authorities?.contains(PermissionKeys.surveyView) ?? false,
      isInvoiceView: authorities?.contains(PermissionKeys.invoiceView) ?? false,
    );
  }
}

final class PermissionKeys {
  PermissionKeys._();

  // Contract
  static const String leasingContractView = 'leasing_contract:view';

  // News
  static const String newsView = 'news:view';

  // Ticket
  static const String ticketView = 'ticket:view';
  static const String createTicket = 'ticket:create';

  // Payment
  static const String paymentView = 'invoice:view';

  // Vehicle History
  static const String parkingRegistrationView = 'parking_registration:view';
  static const String parkingRegistrationCreate = 'parking_registration:create';
  static const String parkingRegistrationUpdate = 'parking_registration:update';
  static const String parkingRegistrationDelete = 'parking_registration:delete';

  // Vehicle
  static const String vehicleView = 'vehicle:view';
  static const String vehicleUpdate = 'vehicle:update';

  // Service
  static const String bookingServiceView = 'booking_service:view';
  static const String bookingServiceCreate = 'booking_service:create';
  static const String bookingServiceUpdate = 'booking_service:update';

  // Survey
  static const String surveyView = 'survey:view';

  // Invoice
  static const String invoiceView = 'invoice:view';
}
