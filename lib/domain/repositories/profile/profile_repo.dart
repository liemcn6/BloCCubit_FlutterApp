import 'package:home_care/data/models/request/authentication/sign_out_request.dart';
import 'package:home_care/data/models/response/profile/profile_edit_response.dart';
import 'package:home_care/domain/entities/profile/user_profile.dart';

mixin ProfileRepo {
  Future<UserProfile?> requestProfile();
  Future<bool> requestEditProfile(ProfileEditResponse profileData);
  Future<bool> requestSignOut(SignOutRequest request);
  Future<bool> deleteAccount();
}
