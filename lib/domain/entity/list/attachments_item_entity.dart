import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/data/model/list/attachments_item_model.dart';

class AttachmentsItemEntity extends Equatable {
  final String? fileHumanName;
  final String? insertDate;
  final int? id;
  final Object? mimeType;
  final int? fileSize;

  const AttachmentsItemEntity({
    required this.fileHumanName,
    required this.insertDate,
    required this.id,
    required this.mimeType,
    required this.fileSize,
  });

  AttachmentsItemModel toModel() {
    return AttachmentsItemModel(
        fileHumanName: fileHumanName,
        insertDate: insertDate,
        id: id,
        mimeType: mimeType,
        fileSize: fileSize);
  }

  @override
  List<Object?> get props =>
      [fileHumanName, insertDate, id, mimeType, fileSize];
}
