import 'package:equatable/equatable.dart';

class Hotline extends Equatable {
  final String title;
  final String phoneNumber;

  const Hotline({
    required this.title,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        title,
        phoneNumber,
      ];
}
