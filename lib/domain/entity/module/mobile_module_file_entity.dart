import 'package:equatable/equatable.dart';

class MobileModuleFileEntity extends Equatable {
  final int id;
  final int mobileModuleId;
  final String name;
  final String filePathRu;
  final String filePathKz;

  const MobileModuleFileEntity({
    required this.id,
    required this.mobileModuleId,
    required this.name,
    required this.filePathRu,
    required this.filePathKz,
  });

  @override
  List<Object?> get props => [id, mobileModuleId, name, filePathRu, filePathKz];
}
