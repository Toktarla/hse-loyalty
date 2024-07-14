import 'package:equatable/equatable.dart';

class MobileModuleEntity extends Equatable {
  final int? id;
  final int? parentId;
  final String? code;
  final String? name;
  final int? type;
  final int? ord;
  final String? url;

  const MobileModuleEntity({
    required this.id,
    required this.parentId,
    required this.code,
    required this.name,
    required this.type,
    required this.ord,
    required this.url
  });

  @override
  List<Object?> get props => [id, parentId, code, name, type, ord, url];
}
