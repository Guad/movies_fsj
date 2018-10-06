class Movie {
  final String title;
  final int id;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double vote_average;

  Movie({this.title, this.id, this.overview, this.posterPath, this.backdropPath, this.vote_average});

  Movie.fromJson(Map<String, dynamic> map) :
    id = map['id'],
    title = map['title'],
    overview = map['overview'],
    posterPath = map['poster_path'],
    vote_average = map['vote_average'],
    backdropPath = map['backdrop_path'];
}