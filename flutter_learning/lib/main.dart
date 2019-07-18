import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/data/datasources/data_provider.dart';
import 'package:flutter_learning/data/repositories/article_repository.dart';
import 'package:flutter_learning/data/repositories/authentication_repository.dart';
import 'package:flutter_learning/domain/blocs/article/bloc.dart';
import 'package:flutter_learning/domain/blocs/authentication/authentication.dart';
import 'package:flutter_learning/domain/blocs/bloc_delegate.dart';
import 'package:flutter_learning/presentation/pages/home_page.dart';
import 'package:flutter_learning/presentation/pages/login_page.dart';
import 'package:flutter_learning/presentation/pages/splash_page.dart';
import 'package:flutter_learning/presentation/widgets/login_indicator.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  final DataProvider dataProvider = DataProvider();

  final ArticleRepository articleRepository = ArticleRepository(dataProvider);

  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (BuildContext context) {
        return AuthenticationBloc(authenticationRepository)
          ..dispatch(AppStarted());
      },
      child: MyApp(articleRepository: articleRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ArticleRepository articleRepository;

  MyApp({Key key, @required this.articleRepository})
      : assert(articleRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }

          if (state is AuthenticationAuthenticated) {
            return HomePage(articleRepository);
          }

          if (state is AuthenticationLoading) {
            return LoginIndicator();
          }

          if (state is AuthenticationUnauthenticated) {
            return LoginPage();
          }
        },
      ),
    );
  }
}
