import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String insertDate;
  final String title;
  final int id;
  final bool isRead;

  const NotificationEntity({
    required this.insertDate,
    required this.title,
    required this.id,
    required this.isRead,
  });

  @override
  List<Object?> get props => [insertDate, title, id, isRead];
}
