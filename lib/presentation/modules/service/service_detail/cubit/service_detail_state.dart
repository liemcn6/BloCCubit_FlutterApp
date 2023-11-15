import 'package:equatable/equatable.dart';
import 'package:home_care/domain/entities/service/service_detail.dart';

class ServiceDetailState extends Equatable {
  final List<ServiceDetail>? serviceDetailList;
  final ServiceDetail? serviceDetail;
  final FacilityOption? facilityOptionSelect;
  final DateTime? timeRegisterSelect;
  final DateTime? timeTemporarily;
  final bool? disableRegisterButton;
  final bool? loadMore;

  const ServiceDetailState({
    this.serviceDetailList,
    this.serviceDetail,
    this.facilityOptionSelect,
    this.timeRegisterSelect,
    this.timeTemporarily,
    this.disableRegisterButton,
    this.loadMore,
  });

  ServiceDetailState copyWith({
    List<ServiceDetail>? serviceDetailList,
    ServiceDetail? serviceDetail,
    FacilityOption? facilityOptionSelect,
    DateTime? timeRegisterSelect,
    DateTime? timeTemporarily,
    bool? disableRegisterButton,
    bool? loadMore,
  }) {
    return ServiceDetailState(
      serviceDetailList: serviceDetailList ?? this.serviceDetailList,
      serviceDetail: serviceDetail ?? this.serviceDetail,
      facilityOptionSelect: facilityOptionSelect ?? this.facilityOptionSelect,
      timeRegisterSelect: timeRegisterSelect ?? this.timeRegisterSelect,
      timeTemporarily: timeTemporarily ?? this.timeTemporarily,
      disableRegisterButton: disableRegisterButton ?? this.disableRegisterButton,
      loadMore: loadMore ?? this.loadMore,
    );
  }

  @override
  List<Object?> get props => [
        serviceDetailList,
        serviceDetail,
        facilityOptionSelect,
        timeRegisterSelect,
        timeTemporarily,
        disableRegisterButton,
        loadMore,
      ];
}
