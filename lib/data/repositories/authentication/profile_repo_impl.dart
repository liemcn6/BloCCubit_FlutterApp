import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/authentication/sign_out_request.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/profile/profile_data_response.dart';
import 'package:home_care/data/models/response/profile/profile_edit_response.dart';
import 'package:home_care/domain/entities/profile/user_profile.dart';
import 'package:home_care/domain/repositories/profile/profile_repo.dart';

class ProfileRepoImpl extends BaseRepository with ProfileRepo {
  @override
  Future<UserProfile?> requestProfile() async {
    UserProfile? userProfile;

    final result = await Result.guardAsync(() => get(ApiEndpoints.profile));

    result.ifSuccess((data) {
      if (data?.data != null) {
        final BaseResponse baseResponse = BaseResponse.fromJson(data?.data);
        final ProfileDataResponse profileData = ProfileDataResponse.fromJson(baseResponse.data);

        userProfile = UserProfile(
          accountType: profileData.accountType,
          email: profileData.email,
          fullName: profileData.fullName,
          gender: profileData.gender,
          id: profileData.id,
          phoneNumber: profileData.phoneNumber,
          username: profileData.username,
          dayOfBirth: profileData.dayOfBirth,
          avatarFileUrl: profileData.avatarFileUrl,
          avatarFileId: profileData.avatarFileId,
          organization: profileData.organization,
          address: '',
        );
      }
    });

    return userProfile;
  }

  @override
  Future<bool> requestEditProfile(ProfileEditResponse profileData) async {
    bool isDone = false;

    final result = await Result.guardAsync(() => post(ApiEndpoints.profile, profileData));

    result.ifSuccess((data) {
      isDone = true;
    });

    return isDone;
  }

  @override
  Future<bool> requestSignOut(SignOutRequest request) async {
    bool isDone = false;

    final res = await Result.guardAsync(() => post(ApiEndpoints.logout, request));

    res.ifSuccess((data) {
      isDone = true;
    });

    return isDone;
  }

  @override
  Future<bool> deleteAccount() async {
    bool isDone = false;

    final res = await Result.guardAsync(() => get(ApiEndpoints.deleteAccount));

    res.ifSuccess((data) {
      isDone = true;
    });

    return isDone;
  }
}
