import '../../../domain/entity/home/news_entity.dart';
import '../../../domain/entity/home/news_top_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel({
    required String publishDate,
    required String insertDate,
    required String text,
    required int id,
    required String url,
    required String name,
  }) : super(
    publishDate: publishDate,
    insertDate: insertDate,
    text: text,
    id: id,
    url: url,
    name: name,
  );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      publishDate: json['publishDate'],
      insertDate: json['insertDate'],
      text: json['text'],
      id: json['id'],
      url: json['url'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'publishDate': publishDate,
      'insertDate': insertDate,
      'text': text,
      'id': id,
      'url': url,
      'name': name,
    };
  }

  NewsEntity toEntity() {
    return NewsModel(
      publishDate: publishDate,
      insertDate: insertDate,
      text: text,
      id: id,
      url: url,
      name: name,
    );
  }
}

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

  NewsTopEntity toEntity() {
    return NewsTopEntity(
      url: url,
      name: name,
    );
  }
}
