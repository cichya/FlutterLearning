import 'package:equatable/equatable.dart';
import 'package:flutter_learning/domain/models/article.dart';

class FavoriteState extends Equatable {
  FavoriteState([List properties = const []]) : super(properties);
}

class FavoritesUninitialized extends FavoriteState {
  @override
  String toString() => 'FavoritesUninitialized';
}

class FavoritesFetched extends FavoriteState {
  final List<Article> favoriteArticles;

  FavoritesFetched(this.favoriteArticles) : super([favoriteArticles]);

  @override
  String toString() => 'FavoritesFetched';
}

class FavoritesError extends FavoriteState {
  @override
  String toString() => 'FavoritesError';
}
