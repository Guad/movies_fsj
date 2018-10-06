import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_fsj/api.dart';
import 'package:movies_fsj/pages/movie_page.dart';
import 'package:movies_fsj/tools/movie.dart';

class WatchList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WatchListState();
  }
}

class WatchListState extends State<WatchList> {
  @override
  void initState() {
    super.initState();

    _popularFuture = Api.getMovies();
  }

  Future<List<Movie>> _popularFuture;
  int _index = 0;
  int _max = 2;

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
                'En Cines',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: _index <= 0
                      ? null
                      : () {
                          setState(() {
                            _index--;
                          });
                        },
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: _index >= _max - 1
                      ? null
                      : () {
                          setState(() {
                            _index++;
                          });
                        },
                ),
              ]),
            ],
          ),
        ),
        FutureBuilder<List<Movie>>(
          future: _popularFuture,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              _max = snapshot.data.length;
              var m = snapshot.data[_index];

              return ClipRRect(
                borderRadius: new BorderRadius.circular(5.0),
                child: Stack(
                  children: [
                    Container(
                      height: 200.0,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      // color: Colors.orange,
                      child: new BackdropFilter(
                        filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: new Container(
                          decoration: new BoxDecoration(
                            color: Colors.white.withOpacity(0.0),
                          ),
                        ),
                      ),
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            Api.imageUrl(m.backdropPath),
                          ),
                          fit: BoxFit.cover,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Image.network(
                                Api.imageUrl(m.posterPath),
                                height: 150.0,
                              ),
                            ),
                            Flexible(
                              child: SizedBox(
                                height: 180.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        m.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: ClipRect(
                                          clipper: MyClipper(),
                                          child: Text(m.overview,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: FlatButton(
                                          child: Text('Watch',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MoviePage(
                                                        movie: m,
                                                      )),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        SizedBox(
          height: 30.0,
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTWH(0.0, 0.0, 300.0, 80.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
