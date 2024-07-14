import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String publishDate;
  final String insertDate;
  final String text;
  final int id;
  final String url;
  final String name;

  const NewsEntity({
    required this.publishDate,
    required this.insertDate,
    required this.text,
    required this.id,
    required this.url,
    required this.name,
  });

  @override
  List<Object?> get props => [publishDate, insertDate, text, id, url, name];
}
