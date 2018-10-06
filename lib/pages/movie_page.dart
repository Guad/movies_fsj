import 'package:flutter/material.dart';
import 'package:movies_fsj/api.dart';
import 'package:movies_fsj/tools/movie.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;

  const MoviePage({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Image.network(Api.imageUrl(movie.backdropPath)),
              SizedBox(
                height: 200.0,
                              child: Align(
                  alignment: Alignment(-0.8, 3.0),
                  child: Image.network(Api.imageUrl(movie.posterPath),
                  width: 80.0,),
                  ),
              )
            ],)
          ],
        ),
      ),
    )
    );
  }
}
