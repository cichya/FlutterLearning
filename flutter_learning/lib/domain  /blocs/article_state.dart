import 'package:equatable/equatable.dart';
import 'package:flutter_learning/domain%20%20/models/article.dart';

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
  final int itemsNumber;
  final bool isLastPage;

  ArticlesFetched(
      {this.articles, this.currentPage, this.itemsNumber, this.isLastPage})
      : super([articles, currentPage, itemsNumber, isLastPage]);

  ArticlesFetched copyState(
      {List<Article> arts, int currentPg, int itemsNum, bool isLpage}) {
    return ArticlesFetched(
        articles: arts ?? this.articles,
        currentPage: currentPg ?? this.currentPage,
        itemsNumber: itemsNum ?? this.itemsNumber,
        isLastPage: isLpage ?? this.isLastPage);
  }

  @override
  toString() =>
      'ArticlesFetched (articles: ${articles.length}, currentPage: $currentPage, itemsNumber: $itemsNumber, isLastPage: $isLastPage)';
}
