import '../../../domain/entity/module/mobile_module_entity.dart';

class MobileModuleModel extends MobileModuleEntity {
  const MobileModuleModel({
    int? id,
    int? parentId,
    String? code,
    String? name,
    int? type,
    int? ord,
    String? url,
  }) : super(
      id: id,
      parentId: parentId,
      code: code,
      name: name,
      type: type,
      ord: ord,
      url: url
  );

  factory MobileModuleModel.fromJson(Map<String, dynamic> json) {
    return MobileModuleModel(
        id: json['Id'],
        parentId: json['ParentId'],
        code: json['Code'],
        name: json['Name'],
        type: json['Type'],
        ord: json['Ord'],
        url: json['Url']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'ParentId': parentId,
      'Code': code,
      'Name': name,
      'Type': type,
      'Ord': ord,
      'Url': url
    };
  }

  MobileModuleEntity toEntity() {
    return MobileModuleEntity(id: id,
        parentId: parentId,
        code: code,
        name: name,
        type: type,
        ord: ord,
        url: url
    );
  }

}