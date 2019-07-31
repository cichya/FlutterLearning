import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/domain/blocs/favorite/bloc.dart';
import 'package:flutter_learning/domain/blocs/favorite/favorite_bloc.dart';
import 'package:flutter_learning/domain/models/article.dart';

class FavoritesPage extends StatefulWidget {
  final FavoriteBloc _favoriteBloc;

  FavoritesPage(this._favoriteBloc);

  @override
  State<StatefulWidget> createState() {
    return _FavoritesPageState();
  }
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocProvider(
        builder: (context) => widget._favoriteBloc..dispatch(LoadFavorite()),
        child: BlocBuilder<FavoriteEvents, FavoriteState>(
          bloc: widget._favoriteBloc,
          builder: (BuildContext context, FavoriteState state) {
            if (state is FavoritesUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is FavoritesFetched) {
              if (state.favoriteArticles.isEmpty) {
                return Center(
                  child: Text('No favorite articles. Please add some'),
                );
              }

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(state.favoriteArticles[index].id.toString()),
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
                          title: Text(state.favoriteArticles[index].title),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
                itemCount: state.favoriteArticles.length,
              );
            }
          },
        ),
      ),
    );
  }
}
