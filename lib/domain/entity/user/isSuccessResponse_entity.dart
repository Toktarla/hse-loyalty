import 'package:equatable/equatable.dart';

class IsSuccessResponseEntity extends Equatable {
  final int? id;
  final String? name;
  final String? organization;
  final int? organizationId;
  const IsSuccessResponseEntity({this.id,this.organizationId, this.name, this.organization});

  @override
  List<Object?> get props => [id,name,organization,organizationId];
}

