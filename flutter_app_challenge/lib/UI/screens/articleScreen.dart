import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_challenge/models/article.dart';
import 'package:flutter_app_challenge/routes/constRoutes.dart';

class Articlescreen extends StatelessWidget {

  const Articlescreen({super.key, this.article});

   final Article? article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
               Navigator.of(context).pushNamed(homeRoute);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article!.title.toUpperCase(),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15,),
          Text(article!.body),
          const SizedBox(height: 15,),
          Image.network(article!.image.url),
          const SizedBox(height: 15,),
          Text(article!.image.title)
        ],
      ),
    );
  }
}
