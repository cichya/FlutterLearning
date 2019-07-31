import 'package:flutter/material.dart';
import 'package:flutter_learning/domain/blocs/article/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/domain/blocs/authentication/authentication.dart';
import 'package:flutter_learning/domain/blocs/favorite/bloc.dart';
import 'package:flutter_learning/presentation/pages/favorites_page.dart';
import 'package:flutter_learning/presentation/widgets/article.dart';
import 'package:flutter_learning/presentation/widgets/bottom_loader.dart';

class HomePage extends StatefulWidget {
  final ArticleBloc _articleBloc;
  final AuthenticationBloc _authenticationBloc;
  final FavoriteBloc _favoriteBloc;

  HomePage(this._articleBloc, this._authenticationBloc, this._favoriteBloc);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollTreshold = 200.0;
  ArticleBloc _articleBloc;
  AuthenticationBloc _authenticationBloc;
  FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _articleBloc = this.widget._articleBloc;
    _authenticationBloc = this.widget._authenticationBloc;
    _favoriteBloc = this.widget._favoriteBloc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.folder_special),
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesPage(_favoriteBloc)))
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Log out'),
              trailing: Icon(Icons.power_settings_new),
              onTap: () => {_authenticationBloc.dispatch(LoggedOut())},
            )
          ],
        ),
      ),
      body: BlocProvider(
        builder: (context) => _articleBloc..dispatch(FetchArticles()),
        child: BlocBuilder<ArticleEvent, ArticleState>(
          bloc: _articleBloc,
          builder: (BuildContext context, ArticleState state) {
            if (state is ArticlesUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ArticleError) {
              return Center(
                child: Text('Failed to load articles'),
              );
            }

            if (state is ArticlesFetched) {
              if (state.articles.isEmpty) {
                return Center(
                  child: Text('No articles'),
                );
              }

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.articles.length
                      ? BottomLoader()
                      : ArticleWidget(article: state.articles[index]);
                },
                itemCount: state.isLastPage
                    ? state.articles.length
                    : state.articles.length + 1,
                controller: _scrollController,
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _articleBloc.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollTreshold) {
      _articleBloc.dispatch(FetchArticles());
    }
  }
}
