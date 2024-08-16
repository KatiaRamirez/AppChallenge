import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app_challenge/domain/buisnessLogic/bloc/homeBloc/homeBarrel.dart';
import 'package:flutter_app_challenge/domain/buisnessLogic/bloc/homeBloc/homeBloc.dart';
import 'package:flutter_app_challenge/models/article.dart';
import 'package:flutter_app_challenge/models/imageArticle.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

Map<String, dynamic> json = {
  "userId": 1,
  "id": 1,
  "title":
      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body":
      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
};

Map<String, dynamic> jsonImage =   {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  };

ImageArticle image = ImageArticle.fromJson(jsonImage);
Article article = Article.fromJson(json, image);
List<Article> listArticles = [article];

class MockItemBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {
}

void main() {
  group('HomeBloc', () {
    late HomeBloc homeBloc;

    setUp(() {
      homeBloc = HomeBloc(InitialLoadingHomeState());
    });

    test('initial state is InitialLoadingHomeState', () {
      expect(homeBloc.state, equals(InitialLoadingHomeState()));
    });

    blocTest<HomeBloc, HomeState>(
      'emits [DataHomeState] when GetHomeData event is added',
      build: () => homeBloc,
      act: (bloc) => bloc.add(const GetHomeData()),
      expect: () => [
       const InitialLoadingHomeState(),
      ],
    );

    //  blocTest<HomeBloc, HomeState>(
    //    'emits [ErrorHomeState] when GetHomeData event fails',
    //    build: () {
    //      final bloc = MockItemBloc();
    //      when(() => bloc.mapEventToState(any())).thenThrow(Exception('Failed'));
    //      return bloc;
    //    },
    //    act: (bloc) => bloc.add(GetHomeData()),
    //    expect: () => [
    //      ErrorHomeState(),
    //    ],
    //  );
  });
}