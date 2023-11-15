import 'package:equatable/equatable.dart';

class ServiceHistoryType {
  final List<ServiceHistoryTypeData> data;

  const ServiceHistoryType({this.data = const []});
}

class ServiceHistoryTypeData extends Equatable {
  final String? id;
  final String? name;

  const ServiceHistoryTypeData({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
