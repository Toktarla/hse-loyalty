import '../../../domain/entity/module/mobile_module_file_entity.dart';

class MobileModuleFileModel extends MobileModuleFileEntity {
  const MobileModuleFileModel({
    required int id,
    required int mobileModuleId,
    required String name,
    required String filePathRu,
    required String filePathKz,
  }) : super(
          id: id,
          mobileModuleId: mobileModuleId,
          name: name,
          filePathRu: filePathRu,
          filePathKz: filePathKz,
        );

  factory MobileModuleFileModel.fromJson(Map<String, dynamic> json) {
    return MobileModuleFileModel(
      id: json['Id'],
      mobileModuleId: json['MobileModuleId'],
      name: json['Name'],
      filePathRu: json['FilePathRu'],
      filePathKz: json['FilePathKz'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'MobileModuleId': mobileModuleId,
      'Name': name,
      'FilePathRu': filePathRu,
      'FilePathKz': filePathKz,
    };
  }

  MobileModuleFileEntity toEntity() {
    return MobileModuleFileEntity(
        id: id,
        mobileModuleId: mobileModuleId,
        name: name,
        filePathRu: filePathRu,
        filePathKz: filePathKz
    );
  }
}
