part of 'service_registration_cubit.dart';

class ServiceRegistrationState extends Equatable {
  final RowItem serviceGroup;
  final RowItem serviceType;
  final DateTime date;
  final RowItem<ServiceTimeFrame> timeFrame;
  final RowItem<ServiceLocation> locationTag;

  const ServiceRegistrationState({
    required this.serviceGroup,
    required this.serviceType,
    required this.date,
    required this.timeFrame,
    required this.locationTag,
  });

  @override
  List<Object> get props => [
        serviceGroup,
        serviceType,
        date,
        timeFrame,
        locationTag,
      ];

  ServiceRegistrationState copyWith({
    RowItem? serviceGroup,
    RowItem? serviceType,
    DateTime? date,
    RowItem<ServiceTimeFrame>? timeFrame,
    RowItem<ServiceLocation>? locationTag,
  }) {
    return ServiceRegistrationState(
      serviceGroup: serviceGroup ?? this.serviceGroup,
      serviceType: serviceType ?? this.serviceType,
      date: date ?? this.date,
      timeFrame: timeFrame ?? this.timeFrame,
      locationTag: locationTag ?? this.locationTag,
    );
  }
}

final class ServiceRegistrationInitial extends ServiceRegistrationState {
  ServiceRegistrationInitial()
      : super(
          serviceGroup: RowItem.empty(),
          serviceType: RowItem.empty(),
          date: DateTime.now(),
          timeFrame: RowItem.empty(),
          locationTag: RowItem.empty(),
        );
}
