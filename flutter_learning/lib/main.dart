import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/data/datasources/data_provider.dart';
import 'package:flutter_learning/data/repositories/article_repository.dart';
import 'package:flutter_learning/domain/blocs/article_delegate.dart';
import 'package:flutter_learning/domain/blocs/bloc.dart';
import 'package:flutter_learning/presentation/pages/home_page.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Articles'),
        ),
        body: BlocProvider(
          builder: (context) => ArticleBloc(ArticleRepository(DataProvider()))
            ..dispatch(FetchArticles()),
          child: HomePage(),
        ),
      ),
    );
  }
}
