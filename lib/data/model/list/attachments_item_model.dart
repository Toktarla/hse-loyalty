import '../../../domain/entity/list/attachments_item_entity.dart';

class AttachmentsItemModel extends AttachmentsItemEntity {
  const AttachmentsItemModel({
    required String? fileHumanName,
    required String? insertDate,
    required int? id,
    required Object? mimeType,
    required int? fileSize,
  }) : super(
          fileHumanName: fileHumanName,
          insertDate: insertDate,
          id: id,
          mimeType: mimeType,
          fileSize: fileSize,
        );

  factory AttachmentsItemModel.fromJson(Map<String, dynamic> json) {
    return AttachmentsItemModel(
      fileHumanName: json['FileHumanName'] ?? "[]",
      insertDate: json['InsertDate'] ?? "",
      id: json['Id'] ?? "",
      mimeType: json['MimeType'] ?? "",
      fileSize: json['FileSize'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FileHumanName': fileHumanName,
      'InsertDate': insertDate,
      'Id': id,
      'MimeType': mimeType,
      'FileSize': fileSize,
    };
  }

}
