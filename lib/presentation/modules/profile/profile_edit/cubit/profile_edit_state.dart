part of 'profile_edit_cubit.dart';

class ProfileEditState extends Equatable {
  //profile edit
  final String avatarUrl;
  final FullName fullName;
  final PhoneNumber phoneNumber;
  final Email email;
  final String dayOfBirth;
  final String gender;

  //image
  final List<ImageModel> images;

  final String avatarFileId;
  final File avatar;
  //profile info
  final UserProfile userProfile;
  final List<UploadTypeModel> uploadType;

  const ProfileEditState({
    required this.userProfile,
    this.avatarUrl = "",
    required this.avatar,
    this.fullName = const FullName.dirty(""),
    this.phoneNumber = const PhoneNumber.dirty(""),
    required this.avatarFileId,
    required this.dayOfBirth,
    this.email = const Email.dirty(""),
    required this.gender,
    required this.uploadType,
    this.images = const [],
  });

  @override
  List<Object> get props => [
        avatarUrl,
        avatar,
        gender,
        uploadType,
        images,
        avatarFileId,
      ];

  ProfileEditState copyWith({
    UserProfile? userProfile,
    List<ImageModel>? images,
    String? avatarUrl,
    File? avatar,
    FullName? fullName,
    PhoneNumber? phoneNumber,
    Email? email,
    String? dayOfBirth,
    String? gender,
    String? avatarFileId,
    List<UploadTypeModel>? uploadType,
  }) {
    return ProfileEditState(
      userProfile: userProfile ?? this.userProfile,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      avatar: avatar ?? this.avatar,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      dayOfBirth: dayOfBirth ?? this.dayOfBirth,
      gender: gender ?? this.gender,
      avatarFileId: avatarFileId ?? this.avatarFileId,
      uploadType: uploadType ?? this.uploadType,
      images: images ?? this.images,
    );
  }
}

final class ProfileEditInitial extends ProfileEditState {
  ProfileEditInitial()
      : super(
            userProfile: const UserProfile(),
            avatarUrl: "",
            avatar: File(""),
            fullName: const FullName.dirty(""),
            phoneNumber: const PhoneNumber.dirty(""),
            email: const Email.dirty(""),
            gender: "",
            avatarFileId: "",
            dayOfBirth: "",
            uploadType: [],
            images: []);
}
