import 'dart:io';

import 'package:equatable/equatable.dart';

import 'illustration_file.dart';

final class ImageType {
  ImageType._();

  static const String local = 'local';
  static const String network = 'network';
}

class ImageModel extends Equatable {
  final String? id;
  final String? path;
  final File? file;
  final IllustrationFile? networkData;
  final String type;

  const ImageModel({
    this.id,
    this.path,
    this.file,
    this.networkData,
    this.type = ImageType.local,
  });

  ImageModel copyWith({
    String? id,
    String? path,
    File? file,
    IllustrationFile? networkData,
    String? type,
  }) {
    return ImageModel(
      id: id ?? this.id,
      path: path ?? this.path,
      file: file ?? this.file,
      networkData: networkData ?? this.networkData,
      type: type ?? this.type,
    );
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as String?,
      path: json['path'] as String?,
      networkData: json['networkData'] == null
          ? null
          : IllustrationFile.fromJson(json['networkData'] as Map<String, dynamic>),
      type: json['type'] as String? ?? ImageType.local,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'networkData': networkData?.toJson(),
      'type': type,
    };
  }

  @override
  List<Object?> get props => [id, path, file, networkData, type];
}
