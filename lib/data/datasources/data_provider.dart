import 'package:flutter_learning/domain/models/article.dart';

class DataProvider {
  Future<List<Article>> getArticles(int page) async {
    List<Article> result = <Article>[
      
    ];

    var list = new List<int>.generate(20, (i) => i + 1);

    for(var i in list) {
      int id = ((page - 1) * 20) + i;

      result.add(Article(id: id, title: 'Article no $id', content: 'Body of article no $id'));
    }
    
    await Future.delayed(Duration(milliseconds: 500));

    return Future<List<Article>>.value(result);
  }
}