part of 'emergency_support_cubit.dart';

@immutable
class EmergencySupportState extends Equatable {
  final List<Hotline> hotlines;

  const EmergencySupportState({
    required this.hotlines,
  });

  @override
  List<Object> get props => [
        hotlines,
      ];

  EmergencySupportState copyWith({
    List<Hotline>? hotlines,
  }) {
    return EmergencySupportState(
      hotlines: hotlines ?? this.hotlines,
    );
  }
}

final class EmergencySupportInitial extends EmergencySupportState {
  const EmergencySupportInitial() : super(hotlines: const []);
}
