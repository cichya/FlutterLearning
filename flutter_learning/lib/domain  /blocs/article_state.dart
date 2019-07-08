import 'package:equatable/equatable.dart';
import 'package:flutter_learning/domain%20%20/models/article.dart';

abstract class ArticleState extends Equatable {
  ArticleState([List articles = const[]]) : super(articles);
}

class StartFetchingArticles extends ArticleState {
  @override
  String toString() => 'StartFetchingArticles';
}

class EndFetchingArticles extends ArticleState {
  final List<Article> articles;

  EndFetchingArticles({this.articles}) : super([articles]);

  @override
  toString() => 'EndFetchingArticles';
}