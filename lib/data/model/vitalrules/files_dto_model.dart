import '../../../domain/entity/vitalrule/files_dto_entity_entity.dart';

class FilesDtoModel extends FilesDtoEntity {
  const FilesDtoModel({
    required String fileName,
    required String fileUrl,
  }) : super(
    fileName: fileName,
    fileUrl: fileUrl,
  );

  factory FilesDtoModel.fromJson(Map<String, dynamic> json) {
    return FilesDtoModel(
      fileName: json['FileName'],
      fileUrl: json['FileUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FileName': fileName,
      'FileUrl': fileUrl,
    };
  }

  FilesDtoEntity toEntity() {
    return FilesDtoEntity(
      fileName: fileName,
      fileUrl: fileUrl,
    );
  }
}


class BaseFilesDtoModel extends BaseFilesDtoEntity {
  const BaseFilesDtoModel({
    required String fileName,
    required List<int> fileContent,
  }) : super(
    fileName: fileName,
    fileContent: fileContent,
  );

  factory BaseFilesDtoModel.fromJson(Map<String, dynamic> json) {
    return BaseFilesDtoModel(
      fileName: json['fileName'],
      fileContent: List<int>.from(json['fileContent']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fileName': fileName,
      'fileContent': fileContent,
    };
  }

  BaseFilesDtoEntity toEntity() {
    return BaseFilesDtoEntity(
      fileName: fileName,
      fileContent: fileContent,
    );
  }
}

