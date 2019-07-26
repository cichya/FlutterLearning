import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/data/datasources/data_provider.dart';
import 'package:flutter_learning/data/repositories/article_repository.dart';
import 'package:flutter_learning/data/repositories/authentication_repository.dart';
import 'package:flutter_learning/domain/blocs/article/bloc.dart';
import 'package:flutter_learning/domain/blocs/authentication/authentication.dart';
import 'package:flutter_learning/domain/blocs/bloc_delegate.dart';
import 'package:flutter_learning/domain/blocs/login/login.dart';
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

  final AuthenticationBloc _authenticationBloc =
      AuthenticationBloc(authenticationRepository);

  final LoginBloc _loginBloc =
      LoginBloc(authenticationRepository, _authenticationBloc);

  final ArticleBloc _articleBloc = ArticleBloc(articleRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (BuildContext context) {
            return _authenticationBloc..dispatch(AppStarted());
          },
        ),
        BlocProvider<LoginBloc>(
          builder: (BuildContext context) =>
              LoginBloc(authenticationRepository, _authenticationBloc),
        )
      ],
      child: MyApp(
        authenticationBloc: _authenticationBloc,
        loginBloc: _loginBloc,
        articleBloc: _articleBloc,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthenticationBloc authenticationBloc;
  final LoginBloc loginBloc;
  final ArticleBloc articleBloc;

  MyApp(
      {Key key,
      @required this.authenticationBloc,
      @required this.loginBloc,
      @required this.articleBloc})
      : assert(authenticationBloc != null),
        assert(loginBloc != null),
        assert(articleBloc != null),
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
          switch(state.runtimeType) {
            case AuthenticationUninitialized:
              return SplashPage();
            case AuthenticationAuthenticated:
              return HomePage(articleBloc, authenticationBloc);
            case AuthenticationLoading:
              return LoginIndicator();
            case AuthenticationUnauthenticated:
              return LoginPage(loginBloc);
          }
        },
      ),
    );
  }
}
