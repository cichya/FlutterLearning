import 'package:bloc/bloc.dart';
import 'package:flutter_learning/data/repositories/article_repository.dart';
import 'package:flutter_learning/domain/models/article.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _articleRepository;

  ArticleBloc(this._articleRepository);

  @override
  Stream<ArticleState> transform(
    Stream<ArticleEvent> events,
    Stream<ArticleState> Function(ArticleEvent event) next,
  ) {
    return super.transform(
      (events as Observable<ArticleEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => ArticlesUninitialized();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticles && !_isMax(currentState)) {
      try {
        if (currentState is ArticlesUninitialized) {
          final articles = await _fetchArticles(1);
          yield ArticlesFetched(
              articles: articles,
              currentPage: 1,
              itemsNumber: articles.length,
              isLastPage: false);
        }

        if (currentState is ArticlesFetched) {
          final int currentPage = (currentState as ArticlesFetched).currentPage;

          final articles = await _fetchArticles(currentPage + 1);

          yield articles.isEmpty
              ? (currentState as ArticlesFetched).copyState(isLastPage: true)
              : ArticlesFetched(
                  articles:
                      (currentState as ArticlesFetched).articles + articles,
                  currentPage: currentPage + 1,
                  itemsNumber: (currentPage + 1 * 20),
                  isLastPage: false);
        }
      } catch (_) {
        yield ArticleError();
      }
    }
  }

  bool _isMax(ArticleState state) =>
      state is ArticlesFetched && state.isLastPage;

  Future<List<Article>> _fetchArticles(int page) async {
    return await _articleRepository.getAllArticles(page);
  }
}
