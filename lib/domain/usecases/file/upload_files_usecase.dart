import 'dart:io';

import 'package:home_care/domain/entities/file/uploaded_file.dart';
import 'package:home_care/domain/repositories/file/file_repo.dart';

class UploadFilesUseCase {
  final FileRepo _repository;

  UploadFilesUseCase(this._repository);

  Future<List<UploadedFile>?> uploadFile(List<File> files) async {
    return await _repository.uploadFile(files);
  }
}
