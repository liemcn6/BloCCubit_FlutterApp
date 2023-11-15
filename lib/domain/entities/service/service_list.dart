import 'package:equatable/equatable.dart';

class ServiceList {
  final List<ServiceListData> data;

  const ServiceList({this.data = const []});
}

class ServiceListData extends Equatable {
  final String id;
  final String name;
  final String viewUrl;

  const ServiceListData({required this.id, required this.name, required this.viewUrl});

  @override
  List<Object?> get props => [id, name, viewUrl];
}
