import 'package:equatable/equatable.dart';

class ArticleEvent extends Equatable {}

class FetchArticles extends ArticleEvent {
  @override
  String toString() => 'FetchArticles';
}