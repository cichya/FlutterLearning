import 'package:equatable/equatable.dart';
import 'package:flutter_learning/domain/models/article.dart';

abstract class ArticleState extends Equatable {
  ArticleState([List properties = const []]) : super(properties);
}

class ArticlesUninitialized extends ArticleState {
  @override
  String toString() => 'ArticlesUninitialized';
}

class ArticleError extends ArticleState {
  @override
  String toString() => 'ArticleError';
}

class ArticlesFetched extends ArticleState {
  final List<Article> articles;
  final int currentPage;
  final bool isLastPage;

  ArticlesFetched(
      {this.articles, this.currentPage, this.isLastPage})
      : super([articles, currentPage, isLastPage]);

  ArticlesFetched copyState(
      {List<Article> arts, int currentPg, int itemsNum, bool isLastPage}) {
    return ArticlesFetched(
        articles: arts ?? this.articles,
        currentPage: currentPg ?? this.currentPage,
        isLastPage: isLastPage ?? this.isLastPage);
  }

  @override
  toString() =>
      'ArticlesFetched (articles: ${articles.length}, currentPage: $currentPage, isLastPage: $isLastPage)';
}
