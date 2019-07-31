import 'package:flutter_learning/data/datasources/data_provider.dart';
import 'package:flutter_learning/domain/models/article.dart';

class FavoriteRepository {
  final DataProvider _dataProvider;

  FavoriteRepository(this._dataProvider);

  Future<List<Article>> getFavoritesArticle() async {
    return await this._dataProvider.getFavoriteArticles();
  }
}