
import 'package:flutter_app_challenge/domain/buisnessLogic/bloc/homeBloc/homeEvent.dart';
import 'package:flutter_app_challenge/domain/buisnessLogic/bloc/homeBloc/homeState.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app_challenge/domain/buisnessLogic/services/articleService.dart';
import 'package:flutter_app_challenge/models/article.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {
    on<GetHomeData>((event, emit) async {
      emit(const InitialLoadingHomeState());
      List<Article>? response = [];
     try {
      final data = await ArticleService().fetchArticles();
      response = data;
     } catch (e) { emit(ErrorHomeState());}
        if (response == null || response.isEmpty) {
          emit(NoDataHomeState());
        } else {
          emit(DataHomeState(response));
        }
     }
    );
  }
  HomeState get initialState => const InitialLoadingHomeState();
}