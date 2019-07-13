import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learning/domain%20%20/models/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  ArticleWidget({@required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${article.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(article.title),
      isThreeLine: true,
      subtitle: Text(article.content),
      dense: true,
    );
  }
}
