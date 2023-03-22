import 'package:flutter/material.dart';

import '../data/movie.dart';
import '../data/movies_repository.dart';

import '../widgets/movie/movie_details.dart';
import '../widgets/shared/spinner.dart';
import '../widgets/shared/error.dart';

class MovieScreen extends StatefulWidget {
  final int id;
  final MoviesRepository moviesRepository;

  const MovieScreen({
    super.key,
    required this.id,
    required this.moviesRepository,
  });

  @override
  State<MovieScreen> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieScreen> {
  Future<Movie>? _movieFuture;

  @override
  void initState() {
    super.initState();
    _movieFuture = widget.moviesRepository.getMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: _movieFuture,
      builder: (context, snapshot) {
        final movie = snapshot.data;

        Widget body =
            movie == null ? const Spinner() : MovieDetails(movie: movie);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: snapshot.hasError
              ? const Error(
                  text: 'Something went wrong, please try again later.',
                )
              : body,
        );
      },
    );
  }
}
