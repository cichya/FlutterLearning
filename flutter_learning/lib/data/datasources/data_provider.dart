import 'package:flutter_learning/domain/models/article.dart';

class DataProvider {
  Future<List<Article>> articles(int page) async {
    List<Article> result = <Article>[
      
    ];

    var list = new List<int>.generate(20, (i) => i + 1);

    for(var i in list) {
      result.add(Article(id: ((page - 1) * 20) + i, title: 'Article no $i', content: 'Body of article no $i'));
    }
    
    return Future<List<Article>>.value(result);
  }
}