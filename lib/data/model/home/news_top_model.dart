import '../../../domain/entity/home/news_top_entity.dart';

class NewsTopModel extends NewsTopEntity {
  const NewsTopModel({
    required String url,
    required String name,
  }) : super(
    url: url,
    name: name,
  );

  factory NewsTopModel.fromJson(Map<String, dynamic> json) {
    return NewsTopModel(
      url: json['url'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'name': name,
    };
  }

  factory NewsTopModel.fromEntity(NewsTopEntity entity) {
    return NewsTopModel(
      url: entity.url,
      name: entity.name,
    );
  }
}
