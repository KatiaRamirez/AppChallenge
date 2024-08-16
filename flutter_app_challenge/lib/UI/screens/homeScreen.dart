import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_challenge/UI/components/articleCarousel.dart';
import 'package:flutter_app_challenge/domain/buisnessLogic/bloc/homeBloc/homeBloc.dart';
import 'package:flutter_app_challenge/domain/buisnessLogic/bloc/homeBloc/homeEvent.dart';
import 'package:flutter_app_challenge/domain/buisnessLogic/bloc/homeBloc/homeState.dart';
import 'package:flutter_app_challenge/domain/buisnessLogic/providers/themeProvider.dart';
import 'package:flutter_app_challenge/models/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});


  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: getBody(),
      ),
    );
  }

  HomeBloc? _homeBloc;
  var _articleList;
  bool isTap = false;

  @override
  void initState() {
    _homeBloc = HomeBloc(const InitialLoadingHomeState());
    _homeBloc!.add(const GetHomeData());
    _articleList = [];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding:const EdgeInsets.all(20),
        margin:const EdgeInsets.only(top: 20, left: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                'Tap the article you want to read',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isTap = !isTap;
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  });
                },
                icon: isTap
                    ? const Icon(
                        Icons.lightbulb_circle,
                        size: 30,
                        color: Colors.amber,
                      )
                    : const Icon(
                        Icons.lightbulb_circle,
                        size: 30,
                      ))
          ],
        ),
      ),
      buildArticleBloc(),
    ],
        );
  }

  Widget buildArticleBloc() => BlocListener<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) {
          if (state is DataHomeState) {
            // ignore: avoid_function_literals_in_foreach_calls
            state.articles.forEach((article) {
              _articleList.add(article);
            });
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
            bloc: _homeBloc,
            builder: (BuildContext context, HomeState state) {
              if (state is InitialLoadingHomeState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DataHomeState) {
                return buildArticlesCarousel(state.articles);
              } else if (state is NoDataHomeState) {
                return const SizedBox();
              } else if (state is ErrorHomeState) {
                return const SizedBox();
              } else {
                return Container();
              }
            }),
      );

  Widget buildArticlesCarousel(List<Article> articles) {
    return Center(
      child: ArticleCarousel(articles),
    );
  }
}
