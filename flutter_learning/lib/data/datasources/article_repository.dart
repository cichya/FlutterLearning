import 'package:flutter_learning/data/datasources/data_provider.dart';
import 'package:flutter_learning/domain%20%20/models/article.dart';

class ArticleRepository {
  final DataProvider _dataProvider;

  ArticleRepository(this._dataProvider);

  Future<List<Article>> getAllArticles() async {
    return _dataProvider.articles();
  }
}