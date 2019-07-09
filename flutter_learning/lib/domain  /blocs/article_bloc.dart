import 'package:bloc/bloc.dart';
import 'package:flutter_learning/data/datasources/article_repository.dart';
import 'package:flutter_learning/domain%20%20/blocs/bloc.dart';
import 'package:flutter_learning/domain%20%20/models/article.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _articleRepository;

  ArticleBloc(this._articleRepository);

  @override
  ArticleState get initialState => ArticlesUninitialized();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticles) {
      if (currentState is ArticlesUninitialized) {
        final articles = await _fetchArticles(1);
        yield ArticlesFetched(articles: articles);
        return;
      }

      if (event is ArticlesFetched) {
        final int currentPage = (currentState as ArticlesFetched).currentPage;

        final articles = await _fetchArticles(currentPage);

        yield articles.isEmpty
            ? (currentState as ArticlesFetched).copyState()
            : ArticlesFetched(
                articles: (currentState as ArticlesFetched).articles + articles,
                currentPage: currentPage + 1);
      }
    }
  }

  Future<List<Article>> _fetchArticles(int page) async {
    return _articleRepository.getAllArticles();
  }
}
