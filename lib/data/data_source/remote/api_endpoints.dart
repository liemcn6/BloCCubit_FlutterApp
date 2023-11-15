class ApiEndpoints {
  ApiEndpoints._();

  // Authentications
  static const String appConfig = "iam/api/public/app-configs";
  static const String authorities = 'iam/api/me/authorities';
  static const String login = "iam/api/authenticate/mobile";
  static const String refreshToken = "iam/api/refresh-token";
  static const String logout = "iam/api/logout";
  static const String profile = "iam/api/me/profile";
  static const String forgotPassword = "iam/api/account/reset-password/init";
  static const String resetPassword = "iam/api/account/reset-password/finish";
  static const String changePassword = "iam/api/me/change-password";
  static const String deleteAccount = "iam/api/me/inactive";
  static const String register = "iam/api/register";

  //privacy policy
  static const String privacyPolicy = "https://opencity.evotek.vn/#/privacy-policy";

  /// FILE
  static const String uploadFile = "system/api/files/upload";
  static const String uploadFiles = "system/api/files/uploads";

  // HOTLINE
  static const String hotline = "building/api/me/buildings/building-hotlines/mobile-view";

  //building
  static const String buildingList = 'building/api/buildings/auto-complete';
  static const String floorList = 'building/api/buildings/{id}/floors/auto-complete';
  static const String userBuildingList = 'iam/api/me/buildings';

  //newsletters
  static const String searchNews = "system/api/news";
  static String searchNewsDetails(String id) => "system/api/news/$id";
  static const String searchNewsCatalog = "system/api/news-catalog";
  static const String searchNewsMostViewed = "system/api/news/most-viewed";

  /// CONTRACT
  static const String contractList = "partner/api/me/leasing-contracts/mobile-view";
  static String contractDetail(String id) => "partner/api/leasing-contracts/$id/mobile-view";

  /// NOTIFICATION
  static String notification(int pageSize, int pageIndex) =>
      "system/api/me/notifications?pageSize=$pageSize&pageIndex=$pageIndex&sortBy=sendAt.desc";

  static String notificationDelete(String id) => "system/api/me/notifications/$id";

  static String notificationDetail(String eventId) =>
      "system/api/me/notifications/read-by-event-id/$eventId";

  static String notificationRead(String id) => "system/api/me/notifications/$id/mark-read";

  static const String notificationCountUnread = "system/api/me/notifications/count-unread";
  static const String registerTokenFireBase = "system/api/devices";

  // Ticket
  static const String listTicket = "ticket/api/tickets";
  static const String detailTicket = "ticket/api/tickets/{id}";
  static const String updateDraftTicket = "ticket/api/tickets/{id}/issued-by-customer";
  static const String crateTicket = "ticket/api/tickets/issued-by-customer";
  static const String reviewTicket = "ticket/api/tickets/{id}/review";

  // Payment
  static const String paymentStatistic = "partner/api/me/period-transactions/statistic/mobile-view";
  static const String paymentList = "partner/api/me/period-transactions/mobile-view";
  static const String paymentDetail =
      "partner/api/period-transactions/leasing-payment-periods/{id}/mobile-view";
  static const String paymentHistory = "partner/api/me/period-transactions/history";

  // Bill
  static const String billList = "partner/api/invoices";
  static const String billDetail = "partner/api/invoices/{id}";

  /// SURVEY
  static const String listSurvey = "survey/api/me/surveys";
  static const String detailSurvey = "survey/api/me/surveys/{id}/buildings/{buildingID}";
  static const String doSurvey = "survey/api/surveys/{id}/answers";

  // Vehicle
  static const String vehicleList = "partner/api/parking-tickets";
  static const String vehicleHistory = "partner/api/parking-registrations";
  static const String vehicleDetail = "partner/api/parking-tickets/{id}";
  static const String vehicleCancel = "partner/api/parking-tickets/{id}/inactive";
  static const String vehicleHistoryDetail = "partner/api/parking-registrations/{id}";
  static const String vehicleRegistration = "partner/api/parking-registrations";
  static const String vehicleRegistrationUpdate = "partner/api/parking-registrations/{id}/update";
  static const String vehicleRegistrationDelete = "partner/api/parking-registrations/{id}/delete";
  static const String vehicleTypes = "partner/api/buildings/{id}/parking-capacities";

  // Service
  static const String serviceList = "partner/api/facility-groups";
  static const String serviceDetailList = "partner/api/facilities";
  static const String serviceDetail = "partner/api/facilities/{id}";
  static const String serviceBooking = "partner/api/booking-services";
  static const String serviceHistory = "partner/api/me/booking-services";
  static const String serviceType = "partner/api/facilities/auto-complete";
  static const String serviceRecent = "partner/api/facilities/recently";
  static const String serviceBookingId = "partner/api/booking-services/{id}";
  static const String serviceCancelId = "partner/api/booking-services/{id}/cancel";
  static const String serviceCancelApprovalId = "partner/api/booking-services/{id}/cancel-approval";
  static const String serviceGroup = "partner/api/facility-groups/auto-complete";
  static const String serviceTypeTimeFrames = "partner/api/facilities/{id}/options/times";
  static const String serviceLocation = "partner/api/facilities/{id}/options/locations";
  static const String createServiceRegistration = "partner/api/booking-services";
  static const String vehicleRegistrationRequestApproval = "partner/api/parking-registrations/{id}/request-approval-by-customer";
}
