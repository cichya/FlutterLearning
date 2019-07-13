import 'package:flutter_learning/data/datasources/data_provider.dart';
import 'package:flutter_learning/domain/models/article.dart';

class ArticleRepository {
  final DataProvider _dataProvider;

  ArticleRepository(this._dataProvider);

  Future<List<Article>> getAllArticles(int page) async {
    return await _dataProvider.articles(page);
  }
}