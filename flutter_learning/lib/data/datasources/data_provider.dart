import 'package:flutter_learning/domain%20%20/models/article.dart';

class DataProvider {
  Future<List<Article>> articles() async {
    List<Article> result = new List<Article>(1);
      result.add(Article(id: 1, title: 'Article no 1', content: 'Body of article no 1'));

    return Future<List<Article>>.value(result);
  }
}