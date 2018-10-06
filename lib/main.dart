import 'package:flutter/material.dart';
import 'package:movies_fsj/pages/main_page.dart';
import 'package:movies_fsj/tools/movie_json.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TheMovies',
      theme: ThemeData.light(),
      home: MainPage(),
    );
  }
}