import 'package:equatable/equatable.dart';

class UploadedFile extends Equatable {
  final String? id;

  const UploadedFile({this.id});

  @override
  List<Object?> get props => [id];
}
