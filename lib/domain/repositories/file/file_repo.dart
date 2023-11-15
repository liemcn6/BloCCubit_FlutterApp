import 'dart:io';

import 'package:home_care/domain/entities/file/uploaded_file.dart';

mixin FileRepo {
  Future<List<UploadedFile>?> uploadFile(List<File> files);
}
