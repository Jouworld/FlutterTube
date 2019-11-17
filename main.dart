import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:buscavideoyoutube/api.dart';
import 'package:buscavideoyoutube/blocs/videos_bloc.dart';
import 'package:buscavideoyoutube/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  Api api = Api();
  api.search("pablovittar");
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
          child: MaterialApp(
        title: 'FlutterTube',
        debugShowCheckedModeBanner: false,
        home: Home(),
    ),
    );

  }
}



