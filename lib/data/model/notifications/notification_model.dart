import '../../../domain/entity/notifications/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required String insertDate,
    required String title,
    required int id,
    required bool isRead,
  }) : super(
    insertDate: insertDate,
    title: title,
    id: id,
    isRead: isRead,
  );

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      insertDate: json['insertDate'],
      title: json['title'],
      id: json['id'],
      isRead: json['isRead'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'insertDate': insertDate,
      'title': title,
      'id': id,
      'isRead': isRead,
    };
  }

  factory NotificationModel.fromEntity(NotificationEntity entity) {
    return NotificationModel(
      insertDate: entity.insertDate,
      title: entity.title,
      id: entity.id,
      isRead: entity.isRead,
    );
  }
}