import 'package:meta/meta.dart';

class Movie {
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;

  Movie({
    @required this.title,
    @required this.overview,
    @required this.posterPath,
    @required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      voteAverage: (json["vote_average"] as num).toDouble(),
    );
  }

  @override
  String toString() {
    return "Movie name: $title, overview: $overview, poster path: $posterPath, vote average: $voteAverage";
  }
}
