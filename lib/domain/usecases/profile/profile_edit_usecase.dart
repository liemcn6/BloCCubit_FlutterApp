import 'dart:io';

import 'package:home_care/data/models/response/profile/profile_edit_response.dart';
import 'package:home_care/domain/entities/file/uploaded_file.dart';
import 'package:home_care/domain/repositories/file/file_repo.dart';
import 'package:home_care/domain/repositories/profile/profile_repo.dart';

class ProfileEditUseCase {
  final FileRepo _filesUploadRepository;
  final ProfileRepo _profileRepository;
  ProfileEditUseCase(this._filesUploadRepository, this._profileRepository);

  Future<List<UploadedFile>?> requestUpload(List<File> files) async {
    await _filesUploadRepository.uploadFile(files);
    return null;
  }

  Future<bool> requestEditProfile(ProfileEditResponse profileData) async {
    bool isDone = false;
    isDone = await _profileRepository.requestEditProfile(profileData);
    return isDone;
  }
}
