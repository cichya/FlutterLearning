import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoritesPageState();
  }
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    List<String> articles = List<String>();

    articles.add('Article 1');
    articles.add('Article 2');
    articles.add('Article 3');
    articles.add('Article 4');
    articles.add('Article 5');
    articles.add('Article 6');

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(articles[index]),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                print('Delete article');
              }
            },
            background: Container(
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(articles[index]),
                ),
                Divider(),
              ],
            ),
          );
        },
        itemCount: articles.length,
      ),
    );
  }
}
