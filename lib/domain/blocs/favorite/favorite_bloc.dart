import 'package:bloc/bloc.dart';
import 'package:flutter_learning/domain/blocs/favorite/bloc.dart';
import 'package:flutter_learning/domain/models/article.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteState> {
  @override
  FavoriteState get initialState => FavoritesUninitialized();

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvents event) async* {
    if (event is LoadFavorite) {
      try {
        if (currentState is FavoritesUninitialized) {
          List<Article> articles = List<Article>();

          articles.add(Article(id: 1, content: 'content', title: 'title'));

          yield FavoritesFetched(articles);
        }
      } catch (_) {
        yield FavoritesError();
      }
    }
  }
}
