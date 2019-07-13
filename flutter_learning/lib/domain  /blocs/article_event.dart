import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable {}

class FetchArticles extends ArticleEvent {
  @override
  String toString() => 'FetchArticles';
}