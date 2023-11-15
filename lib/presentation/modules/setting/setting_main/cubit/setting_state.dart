part of 'setting_cubit.dart';

class SettingState extends Equatable {
  // Profile
  final UserProfile userProfile;
  final bool biometricAuthenticate;
  final bool canUseBiometric;

  const SettingState({
    required this.userProfile,
    required this.biometricAuthenticate,
    this.canUseBiometric = false,
  });

  @override
  List<Object> get props => [userProfile, biometricAuthenticate, canUseBiometric];

  SettingState copyWith({
    UserProfile? userProfile,
    bool? biometricAuthenticate,
    bool? canUseBiometric,
  }) {
    return SettingState(
      userProfile: userProfile ?? this.userProfile,
      biometricAuthenticate: biometricAuthenticate ?? this.biometricAuthenticate,
      canUseBiometric: canUseBiometric ?? this.canUseBiometric,
    );
  }
}

final class SettingInitial extends SettingState {
  const SettingInitial() : super(userProfile: const UserProfile(), biometricAuthenticate: false);
}
