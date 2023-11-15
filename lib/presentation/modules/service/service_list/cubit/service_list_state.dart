part of 'service_list_cubit.dart';

class ServiceListState extends Equatable {
  final ServiceScreenType type;
  final bool isListLoaded;
  final bool isHistoryLoaded;
  final ServiceList serviceList;
  final List<ServiceDetail> serviceRecent;
  final ServiceHistory serviceHistory;
  final ServiceHistoryTypeData? serviceHistoryType;
  final DateTime? date;
  final bool isTimeCleared;

  const ServiceListState({
    this.type = ServiceScreenType.list,
    this.isListLoaded = false,
    this.isHistoryLoaded = false,
    this.serviceList = const ServiceList(),
    this.serviceRecent = const [],
    this.serviceHistory = const ServiceHistory(),
    this.serviceHistoryType = const ServiceHistoryTypeData(id: "", name: ""),
    this.date,
    this.isTimeCleared = true,
  });

  ServiceListState copyWith({
    ServiceScreenType? type,
    bool? isListLoaded,
    bool? isHistoryLoaded,
    ServiceList? serviceList,
    List<ServiceDetail>? serviceRecent,
    ServiceHistory? serviceHistory,
    ServiceHistoryTypeData? serviceHistoryType,
    DateTime? date,
    bool? isTimeCleared,
  }) {
    return ServiceListState(
      type: type ?? this.type,
      isListLoaded: isListLoaded ?? this.isListLoaded,
      isHistoryLoaded: isHistoryLoaded ?? this.isHistoryLoaded,
      serviceList: serviceList ?? this.serviceList,
      serviceRecent: serviceRecent ?? this.serviceRecent,
      serviceHistory: serviceHistory ?? this.serviceHistory,
      serviceHistoryType: serviceHistoryType ?? this.serviceHistoryType,
      date: date ?? this.date,
      isTimeCleared: isTimeCleared ?? this.isTimeCleared,
    );
  }

  @override
  List<Object?> get props => [
        type,
        isListLoaded,
        isHistoryLoaded,
        serviceList,
        serviceRecent,
        serviceHistory,
        serviceHistoryType,
        date,
        isTimeCleared,
      ];
}

enum ServiceScreenType { list, history }
