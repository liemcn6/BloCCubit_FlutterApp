import 'package:equatable/equatable.dart';
import 'package:home_care/domain/entities/service/service_history_detail.dart';
import 'package:home_care/domain/entities/service/service_register_detail.dart';

enum ServiceHistoryDetailType { detail, history }

class ServiceHistoryDetailState extends Equatable {
  final ServiceHistoryDetailType type;
  final List<ServiceHistoryDetail>? serviceHistoryList;
  final ServiceRegisterDetail? serviceRegisterDetail;
  final bool showCancelButton;
  final bool callApiCancelApproval;
  final bool isLoaded;
  final bool disableConfirm;

  const ServiceHistoryDetailState({
    this.type = ServiceHistoryDetailType.detail,
    this.isLoaded = false,
    this.showCancelButton = false,
    this.serviceRegisterDetail,
    this.serviceHistoryList,
    this.callApiCancelApproval = false,
    this.disableConfirm = true,
  });

  ServiceHistoryDetailState copyWith({
    ServiceHistoryDetailType? type,
    bool? isLoaded,
    bool? showCancelButton,
    List<ServiceHistoryDetail>? serviceHistoryList,
    ServiceRegisterDetail? serviceRegisterDetail,
    bool? callApiCancelApproval,
    bool? disableConfirm,
  }) {
    return ServiceHistoryDetailState(
      type: type ?? this.type,
      isLoaded: isLoaded ?? this.isLoaded,
      showCancelButton: showCancelButton ?? this.showCancelButton,
      serviceHistoryList: serviceHistoryList ?? this.serviceHistoryList,
      serviceRegisterDetail: serviceRegisterDetail ?? this.serviceRegisterDetail,
      callApiCancelApproval: callApiCancelApproval ?? this.callApiCancelApproval,
      disableConfirm: disableConfirm ?? this.disableConfirm,
    );
  }

  @override
  List<Object?> get props => [
        type,
        isLoaded,
        showCancelButton,
        serviceRegisterDetail,
        serviceHistoryList,
        callApiCancelApproval,
        disableConfirm,
      ];
}
