import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_fsj/api.dart';
import 'package:movies_fsj/tools/movie.dart';

class HorizontalMovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HorizontalMovieListState();
  }
}

class HorizontalMovieListState extends State<HorizontalMovieList> {
  @override
  void initState() {
    super.initState();

    _popularFuture = Api.getMovies();
  }

  Future<List<Movie>> _popularFuture;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Populares',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FlatButton(
                child: Text('View All'),
                onPressed: () {
                  setState(() {
                    _popularFuture = Api.getMovies();
                  });
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 225.0,
          child: FutureBuilder<List<Movie>>(
            future: _popularFuture,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data
                      .map((m) => Container(
                            height: 250.0,
                            width: 100.0,
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new ClipRRect(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  child: Image.network(
                                    Api.imageUrl(m.posterPath),
                                    height: 150.0,
                                    width: 150.0,
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(m.title, textAlign: TextAlign.center,),
                                ))
                              ],
                            ),
                          ))
                      .toList(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
