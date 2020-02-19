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
}
