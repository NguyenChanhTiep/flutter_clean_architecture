import 'package:flutter/material.dart';
import 'package:flutter_movie_dp/domain/entities/movie.dart';

class ListMovies extends StatelessWidget {
  final List<Movie> movies;

  ListMovies({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return _buildItem(movie);
      },
    );
  }

  Widget _buildItem(Movie movie) {
    return Container(
      height: 120,
      padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: Row(
        children: <Widget>[
          _buildPosterItem(movie),
          _buildOverviewItem(movie),
        ],
      ),
    );
  }

  Widget _buildPosterItem(Movie movie) {
    return Container(
      height: 120,
      width: 90,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w185/${movie.posterPath}'),
        ),
      ),
    );
  }

  Widget _buildOverviewItem(Movie movie) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            movie.title,
            maxLines: 1,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            movie.overview,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black45),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${movie.voteAverage}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
