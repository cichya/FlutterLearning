import 'package:bloc/bloc.dart';
import 'package:flutter_learning/data/repositories/favorite_repository.dart';
import 'package:flutter_learning/domain/blocs/favorite/bloc.dart';
import 'package:flutter_learning/domain/models/article.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteState> {
  final FavoriteRepository _favoriteRepository;

  FavoriteBloc(this._favoriteRepository);

  @override
  FavoriteState get initialState => FavoritesUninitialized();

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvents event) async* {
    if (event is LoadFavorite) {
      try {
        if (currentState is FavoritesUninitialized) {
          List<Article> articles = await _favoriteRepository.getFavoritesArticle();

          yield FavoritesFetched(articles);
        }
      } catch (_) {
        yield FavoritesError();
      }
    }
  }
}
