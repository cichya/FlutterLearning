import 'package:equatable/equatable.dart';
import 'package:flutter_learning/domain%20%20/models/article.dart';

abstract class ArticleState extends Equatable {
  ArticleState([List properties = const []]) : super(properties);
}

class ArticlesUninitialized extends ArticleState {
  @override
  String toString() => 'ArticlesUninitialized';
}

class ArticlesFetched extends ArticleState {
  final List<Article> articles;
  final int currentPage;

  ArticlesFetched({this.articles, this.currentPage})
      : super([articles, currentPage]);

  ArticlesFetched copyState({List<Article> articles, int currentPage}) {
    return ArticlesFetched(
        articles: articles ?? this.articles,
        currentPage: currentPage ?? this.currentPage);
  }

  @override
  toString() => 'ArticlesFetched';
}
