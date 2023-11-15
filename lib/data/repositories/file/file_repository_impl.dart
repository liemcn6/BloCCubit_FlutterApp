import 'dart:io';

import 'package:dio/dio.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/vehicle/upload_file_resp_data.dart';
import 'package:home_care/domain/entities/file/uploaded_file.dart';
import 'package:home_care/domain/repositories/file/file_repo.dart';
import 'package:http_parser/http_parser.dart';

class FileRepositoryImpl extends BaseRepository with FileRepo {
  @override
  Future<List<UploadedFile>?> uploadFile(List<File> files) async {
    final List<File> imageFiles = [];
    final List<File> pdfFiles = [];
    final List<File> docFiles = [];
    final List<File> xlsFiles = [];

    for (var element in files) {
      final f = FileUtils(element.path);

      if (f.isImage) {
        imageFiles.add(element);
      } else if (f.isPDF) {
        pdfFiles.add(element);
      } else if (f.isDoc) {
        docFiles.add(element);
      } else if (f.isExcel) {
        xlsFiles.add(element);
      }
    }

    final formData = FormData();

    if (imageFiles.isNotEmpty) {
      formData.files.addAll(files.map((i) => MapEntry(
          'files',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
            contentType: MediaType.parse('image/png'),
          ))));
    }
    if (pdfFiles.isNotEmpty) {
      formData.files.addAll(pdfFiles.map((i) => MapEntry(
          'files',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
            contentType: MediaType.parse('application/pdf'),
          ))));
    }
    if (docFiles.isNotEmpty) {
      formData.files.addAll(docFiles.map((i) => MapEntry(
          'files',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
            contentType: MediaType.parse('application/msword'),
          ))));
    }
    if (xlsFiles.isNotEmpty) {
      formData.files.addAll(xlsFiles.map((i) => MapEntry(
          'files',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
            contentType: MediaType.parse('application/vnd.ms-excel'),
          ))));
    }

    final result = await Result.guardAsync(() => post(ApiEndpoints.uploadFiles, formData));

    if (result.isSuccess) {
      final baseResponse = BaseResponse.fromJson(result.data?.data);

      if (Utils.isNullOrEmpty(baseResponse.data)) {
        return null;
      }

      final List<UploadFileRespData> list = List<UploadFileRespData>.from(
        baseResponse.data?.map((e) => UploadFileRespData.fromJson(e)),
      );

      return list.map((e) => UploadedFile(id: e.id)).toList();
    }

    return null;
  }
}
