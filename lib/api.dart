import 'dart:async';
import 'dart:convert';

import 'package:movies_fsj/tools/api_key.dart';
import 'package:movies_fsj/tools/movie.dart';

import 'package:http/http.dart' as http;


class Api {
  static String popularUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$key";

  static String imageUrl(String path) => "https://image.tmdb.org/t/p/w500$path";

  static String movieUrl(String movieId) =>
      "https://api.themoviedb.org/3/movie/$movieId?api_key=$key";

  static Future<List<Movie>> getMovies() async {
    print("Entered in getMovies");
    
    var resp = await http.get(popularUrl);
    
    var decoded = json.decode(resp.body);
    var lista = decoded['results'];
    List<Movie> movies = lista.map((m) => Movie.fromJson(m)).toList().cast<Movie>();
    return movies;
  }
}
