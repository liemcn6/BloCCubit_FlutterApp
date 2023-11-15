import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/models/request/authentication/sign_out_request.dart';
import 'package:home_care/data/models/response/profile/profile_edit_response.dart';
import 'package:home_care/domain/repositories/profile/profile_repo.dart';

class ProfileUseCase {
  final ProfileRepo _profileRepository;

  ProfileUseCase(this._profileRepository);

  Future<void> requestProfile() async {
    final userProfile = await _profileRepository.requestProfile();

    await AppSecureStorage.setProfile(userProfile);
  }

  Future<bool> requestEditProfile(ProfileEditResponse profileData) async {
    bool isDone = await _profileRepository.requestEditProfile(profileData);
    if (isDone) {
      await requestProfile();
    }
    return isDone;
  }

  Future<bool> requestSignOut(SignOutRequest request) async {
    bool isDone = await _profileRepository.requestSignOut(request);
    return isDone;
  }

  Future<bool> deleteAccount() async {
    bool isDone = await _profileRepository.deleteAccount();
    return isDone;
  }
}
