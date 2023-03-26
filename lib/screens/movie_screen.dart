import 'package:flutter/material.dart';

import '../data/models/movie.dart';
import '../data/services/movies_repository.dart';

import '../widgets/movie/movie_details.dart';
import '../widgets/shared/error_message.dart';
import '../widgets/shared/spinner.dart';

class MovieScreen extends StatefulWidget {
  final int id;
  final MoviesRepository moviesRepository;
  final bool isAdded;
  final Function addMovieToWatchList;
  final Function removeMovieFromWatchList;

  const MovieScreen({
    super.key,
    required this.id,
    required this.moviesRepository,
    required this.isAdded,
    required this.addMovieToWatchList,
    required this.removeMovieFromWatchList,
  });

  @override
  State<MovieScreen> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieScreen> {
  late Future<Movie> _movieFuture;

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
        final Movie? movie = snapshot.data;
        final Widget body;

        if (movie == null) {
          body = const Spinner();
        } else {
          body = MovieDetails(
            moviesRepository: widget.moviesRepository,
            movie: movie,
            isAdded: widget.isAdded,
            addMovieToWatchList: widget.addMovieToWatchList,
            removeMovieFromWatchList: widget.removeMovieFromWatchList,
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: snapshot.hasError
              ? const ErrorMessage(
                  text: 'Something went wrong, please try again later.',
                )
              : body,
        );
      },
    );
  }
}
