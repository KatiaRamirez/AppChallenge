import 'dart:convert';

import 'package:flutter_app_challenge/models/imageArticle.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_challenge/models/article.dart';

class ArticleService {

Future<List<Article>> fetchArticles () async {
 final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
 var imageList = await fetchImages();

     if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      return json.map((data) => Article.fromJson(data, imageList[data['id']])).toList();
    } else {
      throw Exception('Failed to load articles');
    }
}

Future<List<ImageArticle>> fetchImages () async {
 final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

     if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      return json.map((data) => ImageArticle.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch images');
    }
}
}
