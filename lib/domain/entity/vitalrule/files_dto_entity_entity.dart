// FilesDto class
import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/data/model/vitalrules/files_dto_model.dart';

class FilesDtoEntity extends Equatable {
  final String fileName;
  final String fileUrl;

  const FilesDtoEntity({
    required this.fileName,
    required this.fileUrl,
  });

  FilesDtoModel toModel() {
    return FilesDtoModel(
        fileName: fileName,
        fileUrl: fileUrl
    );
  }

  @override
  List<Object?> get props => [
    fileName,
    fileUrl,
  ];

  @override
  String toString() {
    return 'FilesDto { fileName: $fileName, fileUrl: $fileUrl }';
  }
}

// BaseFilesDto class
class BaseFilesDtoEntity extends Equatable {
  final String fileName;
  final List<int> fileContent;

  const BaseFilesDtoEntity({
    required this.fileName,
    required this.fileContent,
  });

  BaseFilesDtoModel toModel() {
    return BaseFilesDtoModel(
        fileName: fileName,
        fileContent: fileContent
    );
  }

  @override
  List<Object?> get props => [
    fileName,
    fileContent,
  ];

  @override
  String toString() {
    return 'BaseFilesDto { fileName: $fileName }';
  }
}