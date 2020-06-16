import 'package:flutter_clean_architecture/domain/entities/movie.dart';
import 'package:meta/meta.dart';

class MovieModel extends Movie {
  MovieModel({
    @required String title,
    @required String overview,
    @required String posterPath,
    @required double voteAverage,
  }) : super(
            title: title,
            overview: overview,
            posterPath: posterPath,
            voteAverage: voteAverage);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        voteAverage: (json["vote_average"] as num).toDouble());
  }
}
