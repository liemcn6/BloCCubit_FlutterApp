part of 'profile_info_cubit.dart';

class ProfileInfoState extends Equatable {
  // Profile
  final UserProfile userProfile;

  const ProfileInfoState({required this.userProfile});

  @override
  List<Object> get props => [userProfile];

  ProfileInfoState copyWith({
    UserProfile? userProfile,
  }) {
    return ProfileInfoState(userProfile: userProfile ?? this.userProfile);
  }
}

final class ProfileInfoInitial extends ProfileInfoState {
  const ProfileInfoInitial() : super(userProfile: const UserProfile());
}
