import 'package:flutter_app_challenge/models/imageArticle.dart';

class Article {
  final int userId;
  final int id;
  final String title;
  final String body;
  final ImageArticle image;

  Article(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body,
      required this.image});

  factory Article.fromJson(Map<String, dynamic> json, ImageArticle image) {
    return Article(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
        image: image);
  }
}
