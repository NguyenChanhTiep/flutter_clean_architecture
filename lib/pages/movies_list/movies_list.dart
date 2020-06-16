import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/pages/movies_list/bloc/movies_bloc.dart';
import 'package:flutter_clean_architecture/pages/movies_list/bloc/movies_event.dart';
import 'package:flutter_clean_architecture/pages/movies_list/bloc/movies_state.dart';
import 'package:flutter_clean_architecture/pages/movies_list/widgets/list_movie_widget.dart';
import 'package:flutter_clean_architecture/pages/movies_list/widgets/loading_widget.dart';

import '../../injection_container.dart';

class MoviesListPage extends StatefulWidget {
  @override
  _MoviesListPageSate createState() => _MoviesListPageSate();
}

class _MoviesListPageSate extends State<MoviesListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MoviesBloc>(),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is Empty) {
                BlocProvider.of<MoviesBloc>(context)
                    .add(GetPopularMoviesEvent());
              } else if (state is LoadingMovies) {
                return LoadingWidget();
              } else if (state is LoadedMovies) {
                return ListMovies(movies: state.movies);
              } else if (state is ErrorLoadMovies) {
                return Center(
                  child: Text('Error ${state.message}'),
                );
              }
              return LoadingWidget();
            },
          ),
        ],
      ),
    );
  }
}
