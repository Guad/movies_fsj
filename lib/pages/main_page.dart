import 'package:flutter/material.dart';
import 'package:movies_fsj/widgets/fancy_title.dart';
import 'package:movies_fsj/widgets/horizontal_movie_list.dart';
import 'package:movies_fsj/widgets/watch_list.dart';


class MainPage extends StatefulWidget {  
  @override
  State<StatefulWidget> createState() {   
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: SingleChildScrollView(
                              child: Column(children: <Widget>[
          FancyTitle(),
          HorizontalMovieList(),
          WatchList(),
        ],),
              ),
      ),
    );
  }
}