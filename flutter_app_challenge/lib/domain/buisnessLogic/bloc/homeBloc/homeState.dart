import 'package:equatable/equatable.dart';
import 'package:flutter_app_challenge/models/article.dart';

abstract class HomeState extends Equatable{
 const HomeState();
}

class InitialLoadingHomeState extends HomeState {
  const InitialLoadingHomeState();

  @override
  List<Object> get props => [];
}

class DataHomeState extends HomeState {
  const DataHomeState(this.articles);
  final List<Article> articles;
  @override
  List<Object> get props => [];
}

class NoDataHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class ErrorHomeState extends HomeState {
  @override
  List<Object> get props => [];
}
