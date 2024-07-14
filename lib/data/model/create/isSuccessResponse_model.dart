import '../../../domain/entity/user/isSuccessResponse_entity.dart';

class IsSuccessResponseModel extends IsSuccessResponseEntity {
  const IsSuccessResponseModel({
    int? id,
    String? name,
    String? organization,
    int? organizationId
  }) : super(
    id: id,
    name: name,
    organization: organization,
    organizationId: organizationId
  );

  factory IsSuccessResponseModel.fromJson(Map<String, dynamic> json) {
    return IsSuccessResponseModel(
      id: json['Id'],
      name: json['Name'],
      organization: json['Organization'],
      organizationId: json['OrganizationId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Organization': organization,
      'OrganizationId': organizationId
    };
  }

  IsSuccessResponseEntity toEntity() {
    return IsSuccessResponseEntity(
      id: id,
      name: name,
      organization: organization,
      organizationId: organizationId
    );
  }
}