import 'package:equatable/equatable.dart';

class NewsTopEntity extends Equatable {
  final String url;
  final String name;

  const NewsTopEntity({
    required this.url,
    required this.name,
  });

  @override
  List<Object?> get props => [url, name];
}
