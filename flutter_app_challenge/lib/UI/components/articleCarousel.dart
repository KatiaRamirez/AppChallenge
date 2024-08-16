import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/models/article.dart';
import 'package:flutter_app_challenge/routes/constRoutes.dart';

class ArticleCarousel extends StatefulWidget {
  final List<Article> articleList;

 ArticleCarousel(this.articleList);
  @override
  ArticleCarouselState createState() => ArticleCarouselState();
}

class ArticleCarouselState extends State<ArticleCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.articleList.length,
        itemBuilder: (context, index, realIndex) {
          final article = widget.articleList[index];
          return Container(
            margin: const EdgeInsets.all(5),
            child: Hero(tag: article.id, child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(articleRoute, arguments: article);
              },
              child: Container(
                margin:const EdgeInsets.symmetric(horizontal: 5),
                child: Card(
                  shadowColor: Colors.grey,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(article.image.url, fit: BoxFit.contain,),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            article.title.toUpperCase(),
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0, left: 15),
                          child: Text(article.body,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.start),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        );
      }
        ,
        options: CarouselOptions(
          height: 550,
          autoPlay: false,
          enlargeCenterPage: false,
          viewportFraction: 0.8,
          aspectRatio: 16/9,
          initialPage: 0,
        ),);
  }
}
