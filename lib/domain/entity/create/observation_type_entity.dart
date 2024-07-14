import 'package:equatable/equatable.dart';

class ObservationTypeEntity extends Equatable {
  final Object? lastChangeDate;
  final int id;
  final Object? code;
  final String createDate;
  final String name;

  const ObservationTypeEntity({
    this.lastChangeDate,
    required this.id,
    this.code,
    required this.createDate,
    required this.name,
  });

  @override
  List<Object?> get props => [lastChangeDate, id, code, createDate, name];
}
